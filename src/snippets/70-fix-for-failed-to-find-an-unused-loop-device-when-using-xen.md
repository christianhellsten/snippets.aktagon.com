---
id: '70'
title: Fix for "Failed to find an unused loop device" when using xen
languages:
- bash
tags:
- git
- repository
---
If you use Xen and get an error "Failed to find an unused loop device" when you try to create a guest then you are probably using disk images and have run out of loop devices. Each guest uses at least two loop devices. Modify (or create) a file called <i>/etc/modprobe.d/local-loop</i> and add this line:


```bash
options loop max_loop=64
```
    

Use a number suitable for your needs. With 64 loop devices you can run up to 32 guests on your host, assuming you aren't using loop devices for any other purposes.

