---
id: '836'
title: How to add static routes to the routing table in Ubuntu and Debian
languages:
- bash
tags:
---
Install ifupdown-extra scripts:

```bash
sudo apt-get install ifupdown-extra
```

Add routes:

```bash
sudo vim /etc/network/routes
```

Reload routes:

```bash
sudo /etc/init.d/networking-routes restart
```

View routes:

```bash
ip route
```

Tested on Ubuntu 16.
