---
id: '190'
title: Trusted and sensitive email protection with GPG using Gmail with Firefox
languages:
- bash
tags:
- communication
- database
- mattermost
- schema
- slack
---
It's really simple to use GPG to encrypt and/or sign email you send through Gmail.

Generate your private key.


```bash
gpg --gen-key
```
    

Extract your public key, which you will send to people you need to communicate securely with.


```bash
gpg --armor --export marko.haapala@ihatespamaktagon.com > my_public_pgp_key
```
    

Install [FireGPG](http://getfiregpg.org/) and restart the browser. Use GPG in Gmail.

