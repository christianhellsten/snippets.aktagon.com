---
id: '931'
title: 'Ban invalid HTTP requests with fail2ban '
languages:
- bash
tags:
---
The goal is to use fail2ban to block invalid HTTP requests sent to nginx from Iran:

```bash
"45.132.170.81 - - [04/Jan/2021:02:46:12 +0000] "\x10\xD2\xE9\xA68\x8A\x98\xB3\x00\xB9mO\xD7\xC9\xAA]"
```

The request is a HEX encoded string instead of the normal "GET /".

First, configure the jail:

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Add the following at the end of the file:

```bash
[nginx-idiots]
enabled  = true
port     = http,https
filter   = nginx-idiots
logpath  = /var/log/nginx/access.log
# NOTE: Docker will override fail2ban's rules, so good luck with iptables:
# logpath = /var/lib/docker/containers/*/*.log
bantime  = 86400
findtime = 86400
maxretry = 2
```

Add a filter to block the idiots:

```bash
sudo vim /etc/fail2ban/filter.d/nginx-idiots.conf
```

```
[Definition]
failregex = ^.* <HOST> .*".*\\x.*".*$
ignoreregex =
```

Test the regex:

```bash
sudo fail2ban-regex -v --print-all-missed /var/log/nginx/access.log /etc/fail2ban/filter.d/nginx-idiots.conf
```

Restart fail2ban.

View banned IPs with:

```bash
sudo fail2ban-client status nginx-idiots
```

Note that this could also be a real idiot that is sending SSL traffic to the non-SSL port, or someone who has configured SSL traffic to be sent to the non-SSL port.
