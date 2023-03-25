---
id: '109'
title: Password protecting a folder/resource with Nginx
languages:
- bash
tags:
---
First add the following to your Nginx configuration file:


```bash
location / {
  auth_basic            "Restricted";
  auth_basic_user_file  /etc/nginx/htpasswd;
}
```
    

Then create the htpasswd file:


```bash
# this be passwords
thisbetheusername:thisbeencryptedpass:yercomment
```
    

To generate a htpasswd password without installing Apache you can use the following Perl or Ruby code:

**Perl**


```bash
perl -le 'print crypt("password", "salt")'
```
    

**Ruby (run in irb)**


```bash
"password".crypt("salt")
```
    

The crypt() method uses 56-bit DES encryption, which is used in /etc/passwd and htpasswd.

