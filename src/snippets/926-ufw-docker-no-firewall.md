---
id: '926'
title: UFW + Docker = No firewall
languages:
tags:
---
TLDR: Docker can and will override existing iptable rules and expose your services to the Internet

This means you have to think twice when installing Docker on a machine that is only protected by an iptables-based firewall such as UFW. You might think you are protected by your firewall, but you very likely are not. This is probably one of the more common reasons why Elasticsearch servers, which are unprotected by default, are exposed to the internet.

For details, see:
https://github.com/docker/for-linux/issues/690

## Solution 1: External firewall

One solution is to use a firewall provided by the hosting provider (DO, AWS, GCP, etc.).

## Solution 2: Disable Docker's iptables "feature"

Disable iptables in Docker by adding the following switch:

```
--iptables=false
```

## Solution 2: Listen on private IPs

This is perhaps the easiest to implement and easiest to forget: expose your containers and services on one of the following private IP address ranges:

- 10.0.0.0 to 10.255.255.255
- 172.16.0.0 to 172.31.255.255
- 192.168.0.0 to 192.168.255.255

Note that binding to 127.0.0.1 will not work with Docker Swarm.

