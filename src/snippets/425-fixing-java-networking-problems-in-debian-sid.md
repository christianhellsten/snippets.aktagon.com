---
id: '425'
title: Fixing Java networking problems in Debian Sid
languages:
- java
tags:
---
I got bitten by IPV6 **again**. IPV6 is not yet here and probably will not be until the current hard disk is used up. So here is how to fix networking problems for Java applications running on Sid(ux). I suddenly ran into strange network connectivity problems with all Java applications and found they are related to [this](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=560142) bug. You will identify this problem by mysterious IOExceptions during network connections even when telnet makes connections without a hitch.


```java
sudo sysctl -w net.ipv6.bindv6only=0
```
    

For a permanent solution change 1 to 0 for that property in this file: */etc/sysctl.d/bindv6only.conf*

