---
id: '514'
title: Network Interface Aliasing in Linux
languages:
- bash
tags:
---
Sometimes you need to connect to two different networks from the same physical network card, this is when network interface aliasing comes in handy:


```bash
sudo ifconfig eth0:home 192.168.0.1
sudo ifconfig eth0:work 10.0.0.1
```
    

You now have two virtual NICs and can access both network segments.

See [Network Interface Aliasing in Linux](http://www.scribd.com/doc/39071175/69/Network-Interface-Aliasing-in-Linux) for more information.

