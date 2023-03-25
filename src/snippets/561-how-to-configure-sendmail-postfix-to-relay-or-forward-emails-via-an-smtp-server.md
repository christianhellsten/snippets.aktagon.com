---
id: '561'
title: How to configure sendmail/postfix to relay or forward emails via an SMTP server
languages:
tags:
---
1. Uninstall sendmail
2. Install postfix


```
yum install postfix
# or
apt-get install postfix
```
    

3. Configure postfix


```
sudo vim /etc/postfix/main.cf

Add:
relayhost = smtp.devil.com
```
    

