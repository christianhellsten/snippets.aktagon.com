---
id: '753'
title: How to fix "SSL client CA chain cannot be verified" haproxy error
languages:
- bash
tags:
---
Check which client certificates CA names the server accepts
-----------------------------------------------------------


```bash
$ openssl s_client -connect 127.0.0.1:443 -servername xxx.com

Acceptable client certificate CA names
/C=FI/ST=Finland/O=Vaestorekisterikeskus TEST/OU=Terveydenhuollon testiammattivarmenteet/CN=VRK TEST CA for Healthcare Professionals
/C=FI/ST=Finland/O=Vaestorekisterikeskus TEST/OU=Testivarmenteet/CN=VRK CA for Test Purposes
```
    

Export client certificate public key to a file
----------------------------------------------

If needed, export the client certificate's public key to a file, e.g. xyz.pem.

Check who has issued the client certificate:
--------------------------------------------


```bash
$ openssl x509 -in xyz.pem -text

Issuer: C=FI, ST=Finland, O=Vaestorekisterikeskus TEST, OU=Terveydenhuollon testiammattivarmenteet, CN=VRK TEST CA for Healthcare Professionals
```
    

Is the issuer one of the CAs listed in step \#1?

Verify client certificate
-------------------------

If yes, verify the client certificate against haproxy's ca-file:


```bash
cat xyz.pem | openssl verify -CAfile /etc/ssl/certs/haproxy-ca-file.pem
```
    

If validation fails, you probably need to add some root or intermediate certificates to /etc/ssl/certs/haproxy-ca-file.pem.

