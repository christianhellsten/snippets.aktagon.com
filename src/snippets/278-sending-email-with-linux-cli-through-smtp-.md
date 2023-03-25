---
id: '278'
title: Sending email with Linux CLI through SMTP.
languages:
- bash
tags:
- client
- http
- https
- racket
---
Great for scripting e.g [motion](http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome) to send the captured images + movie into your email. No public ssh keys, no passwords, no hassles. Install on Debian with apt-get install sendemail. The email address below has naturally been altered to not be picked up by harvesters.


```bash
sendEmail -f marko_haapala@aktagon_com -t marko_haapala@aktagon_com -m "$(date -I)" -u "Possible intruder" -s smtp.aktagon.com -a /tmp/motion/file.jpg
```
    

