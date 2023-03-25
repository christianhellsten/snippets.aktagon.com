---
id: '174'
title: Linux NAT with 3g PPP connection
languages:
- bash
tags:
---
I run this nat.sh script whenever I need to share my 3g connection to other computers in the switch I'm plugged into. Please note that it resets existing iptables rules.


```bash
#!/bin/bash
iptables --flush            
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

echo 1 > /proc/sys/net/ipv4/ip_forward

internal=eth0
external=ppp0
/sbin/iptables -t nat -A POSTROUTING -o ${external} -j MASQUERADE
/sbin/iptables -A FORWARD -i ${external} -o ${internal} -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i ${internal} -o ${external} -j ACCEPT
```
    

