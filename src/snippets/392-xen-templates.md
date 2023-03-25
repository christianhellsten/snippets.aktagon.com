---
id: '392'
title: Xen templates
languages:
- bash
tags:
- capybara
- ruby
- selenium
---
Description here...


```bash
# Docs
http://wiki.debian.org/Xen?highlight=((DebianInstaller|Xen))#DomU.28guest.29

# 20 Gb disk image
dd if=/dev/zero of=/srv/xen/mailserver.img oflag=direct bs=1M seek=20470 count=1

# Copy template
cp template.cfg domu.cfg

# Edit template
xxx

# Start domU
xm create -c domu.cfg
```
    

