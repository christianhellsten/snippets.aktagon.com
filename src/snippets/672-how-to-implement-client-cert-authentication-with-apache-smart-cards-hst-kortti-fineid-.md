---
id: '672'
title: How to Implement Client-Cert Authentication with Apache (Smart Cards, HST-kortti,
  FINEID)
languages:
- bash
tags:
---
The goal is to automatically sign in users who have an SSL client-certificate issued by a known certificate authority, e.g. Finnish Väestörekisteri (VRK).

First, we’re going to install and configure Apache 2.2 for client-cert authentication.

Install Apache 2.2
------------------


```bash
$ brew install -v httpd22.rb 2>&1
```
    

Download VRK Certificates
-------------------------

In this example we’re using VRK’s root test certificate. Make sure you pick the right certificate for your purposes, e.g. the one for healthcare professionals.

VRK certificates can be downloaded here:
<http://fineid.fi/default.aspx?docid=2293&site=10&id=597>


```bash
$ cd /usr/local/etc/apache2/2.2/
$ mkdir ssl
$ wget http://vrk.fineid.fi/certs/vrktestc.crt
$ mv vrktestc.crt ssl/
# Convert from DER to PEM format
$ openssl x509 -in ssl/vrktestc.crt -inform DER -outform PEM -out ssl/vrktestc.pem
```
    

Download VRK Revocation List
----------------------------

Revocation lists for VRK’s client certificates can be found here:
<http://fineid.fi/default.aspx?docid=2330&site=10&id=588#whereistherevocationlist>


```bash
$ cd /usr/local/etc/apache2/2.2/
$ wget http://proxy.fineid.fi/crl/vrkcqcc.crl
$ mv vrkcqcc.crl ssl/
# Convert CRL file from DER to PEM format
$ openssl crl -in ssl/vrkcqcc.crl -inform der -out ssl/vrkcqcc.crl.pem
```
    

More about [OpenSSL's CRL command](https://www.openssl.org/docs/apps/crl.htm").

Generate Self-Signed Certificate for Apache
-------------------------------------------

If you have a real certificate, skip this part.


```bash
$ cd /usr/local/etc/apache2/2.2/
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/server.key -out ssl/server.crt
```
    

Configure Apache
----------------


```bash
<VirtualHost xxx:443>

ProxyPreserveHost On
ProxyPass / http://0.0.0.0:8888/

SSLCertificateFile "/usr/local/etc/apache2/2.2/ssl/server.crt"
SSLCertificateKeyFile "/usr/local/etc/apache2/2.2/ssl/server.key"
SSLCACertificateFile "/usr/local/etc/apache2/2.2/ssl/vrktestc.pem" 
SSLVerifyClient optional # none, optional, require and optional_no_ca
SSLVerifyDepth 2 # Root certificate requires depth >= 2

# Let Rails know we’re using HTTPS
RequestHeader set X_FORWARDED_PROTO 'https'

#
# Show a help page if client authentication fails.
#
RewriteEngine On
RewriteCond %{SSL:SSL_CLIENT_VERIFY} !^SUCCESS$
RewriteRule .* /ssl-client-verify-failed.html [L]

#
# Forward certificate information to application
# See http://httpd.apache.org/docs/2.2/mod/mod_ssl.html#envvars
#
# Subject's certificate
RequestHeader set SSL_CLIENT_S_DN "%{SSL_CLIENT_S_DN}s"
RequestHeader set SSL_SERVER_S_DN_OU "%{SSL_SERVER_S_DN_OU}s"
# Issuer's certificate
RequestHeader set SSL_CLIENT_I_DN "%{SSL_CLIENT_I_DN}s"
# Verification status: NONE, SUCCESS, GENEROUS or FAILED:reason
RequestHeader set SSL_CLIENT_VERIFY "%{SSL_CLIENT_VERIFY}s"


# Optional settings
#
# Require issuer of certificate to have a specific O and OU:
<Location />
    SSLRequire %{SSL_CLIENT_I_DN_O} eq "Vaestorekisterikeskus TEST" and \
           %{SSL_CLIENT_I_DN_OU} eq "Terveydenhuollon testiammattivarmenteet"
</Location>

# Export SSL and certificate variables
# SSLOptions +ExportCertData +StrictRequire +StdEnvVars

# Revocation list
SSLCARevocationFile "/usr/local/etc/apache2/2.2/ssl/vrkcqcc.crl.pem"
```
    

Remember to [harden your SSL configuration](https://hynek.me/articles/hardening-your-web-servers-ssl-ciphers/).

Troubleshooting & FAQ
---------------------

### How can I verify that the SSL-certificate is set up properly?


```bash
$ openssl s_client -connect localhost:443 -showcerts

Acceptable client certificate CA names
/C=FI/ST=Finland/O=Vaestorekisterikeskus TEST/OU=Certification Authority Services/OU=Varmennepalvelut/CN=VRK TEST Root CA
```
    

### How can I verify the client certificate is valid?

Export the client certificate (e.g. via browser) to a file named, e.g., atte-mussolini.pem and verify it against the CA file:


```bash
cat atte-mussolini.pem | openssl verify -CAfile /usr/local/etc/apache2/2.2/ssl/vrktestc.pem
```
    

### Why am I getting SSL handshake failures?

Invalid self-signed certificate?

### Removing the smart card or disconnecting the smart card reader will close the browser

This means you need to expire the session when the browser is closed. In a Rails application you need to remove expire\_after from session\_store.rb.

### Browser issues

Browers might perform client-cert authentication in different ways. Many browsers have bugs related to client-cert authentication.

Inserting the smart card after starting the browser might mean the SSL client certificate’s information is not sent to the server.

If you’re having issues, the best solution is usually to restart the browser.

### Mac and Safari issues

Safari might present the wrong certificate to the server. You can try to tell Safari to use the right certificate by opening the Keychain Access app and specifying a URL, either full or partial depending on the Safari version, for the certificate you want to use with a specific URL. This is done by adding a "New Certificate Preference" to the certificate.

Safari might not like the "SSLVerifyClient optional", see
<http://www.mnxsolutions.com/apache/safari-providing-an-ssl-error-client-certificate-rejected%E2%80%9D-when-other-browsers-work.html>

One solution to this is using Chrome or Firefox.

Also see:

1.  <http://support.apple.com/kb/HT1679>
2.  <http://support.apple.com/kb/TA22353>
3.  [FINEID + MAC](http://fineid.fi/default.aspx?docid=2230&site=9&id=0)

Another solution I haven't tried might be to use the "SSLCADNRequestFile" setting in mod\_ssl.

### Browser sends the wrong certificate

Try using the [SSLCADNRequestFile](http://httpd.apache.org/docs/2.2/mod/mod_ssl.html#sslcadnrequestfile) mod\_ssl setting to list the certificate authorities your server accepts:

See [the section on certificate\_authorities in rfc4346](http://tools.ietf.org/html/rfc4346#section-7.4.4):


```bash
certificate_authorities
         A list of the distinguished names of acceptable certificate
         authorities.  These distinguished names may specify a desired
         distinguished name for a root CA or for a subordinate CA; thus,
         this message can be used to describe both known roots and a
         desired authorization space.  If the certificate_authorities
         list is empty then the client MAY send any certificate of the
         appropriate ClientCertificateType, unless there is some
         external arrangement to the contrary.
```
    

### Apache is unable to read the revocation list (CRL)

VRK’s revocation certificate is not in the format required by Apache’s mod\_ssl, i.e. the file doesn’t begin with:
----~~BEGIN X509 CRL----~~

This means you need to convert the CRL to PEM format using the following command:


```bash
$ openssl crl -in vrkcqcc.crl -inform der >revoked.pem
```
    

Note that you can also use the LDAP API to get a list of revoked cards. Apache doesn’t support LDAP revocation.

Implementing Client-Cert Authentication in Web Applications
-----------------------------------------------------------

An application that needs to support client-cert authentication should implement the following system and user stories:

\* Enable client-cert authentication (user)

As a user I want to enable client-cert authentication, so that I don’t need to sign in manually.

\* Disable client-cert authentication (user)

\* Sign in user with client certificate (system)

In Ruby on Rails you can access the client-certification information through the headers set by Apache:


```bash
request.headers['HTTP_SSL_CLIENT_S_DN'] == user's distinguished name (DN)
request.headers['HTTP_SSL_CLIENT_I_DN'] == issuer's DN
request.headers['HTTP_SSL_CLIENT_VERIFY'] == 'SUCCESS'
```
    

