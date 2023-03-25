---
id: '543'
title: How to fix "PEM_read_bio:no start line error" nginx error
languages:
- bash
tags:
---
If nginx/OpenSSL gives you this error:


```bash
[emerg]: SSL_CTX_use_PrivateKey_file("/etc/ssl/cert.pem") failed (SSL:
error:0906D06C:PEM routines:PEM_read_bio:no start line error:140B0009:SSL
routines:SSL_CTX_use_PrivateKey_file:PEM lib)
configuration file /etc/nginx/nginx.conf test failed
```
    

It probably means your private key needs to be added to the certificate file
(/etc/ssl/cert.pem). The file will then contain the following:


```bash
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```
    

Remember to test your configuration and verify that nginx can read your certificate
before restarting the server:


```bash
sudo /usr/sbin/nginx -c /etc/nginx/nginx.conf -t
the configuration file /etc/nginx/nginx.conf syntax is ok
configuration file /etc/nginx/nginx.conf test is successful
```
    

If nginx asks you for a PEM password (Enter PEM pass phrase), strip out the
password from the private key:


```bash
openssl rsa -in jebus.key -out jebus-stripped.key
```
    

