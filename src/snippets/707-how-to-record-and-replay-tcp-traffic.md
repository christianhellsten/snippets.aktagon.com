---
id: '707'
title: How to record and replay TCP traffic
languages:
- bash
tags:
---
First attempt
-------------

1) Record TCP traffic with tcpdump to pcap file

Record traffic on ethic from host 196.0.0.1 and port 2332, write to app-traffic.pcap:


```bash
tcpdump -vvv -i eth0 host 192.168.0.1 and port 2332 -w app-traffic.pcap &
```
    

2) View captured traffic


```bash
tcpdump -qns 0 -X -r app-traffic.pcap
```
    

Edit captured traffic if needed with Wireshark.

3) Edit source IP so that it’s on your own network

See the ”example in tcprewrite documentation”:http://tcpreplay.synfin.net/wiki/tcprewrite for details on how to rewrite source IP:


```bash
$ tcprewrite --pnat=10.0.0.0/8:172.16.0.0/12,192.168.0.0/16:172.16.0.0/12 --infile=input.pcap --outfile=output.pcap --skipbroadcast
```
    

4) Replay traffic with tcplivereplay from recorded pcap file (note step \#3)

”See tcpliveplay documentation”:http://tcpreplay.synfin.net/wiki/tcpliveplay for details.

Note that tcpliveplay is only available on Linux not OSX.

Second attempt
--------------

Record:


```bash
sudo tcpdump -i en0 host 192.168.0.1 and port 2332 -w app-traffic.pcap 
```
    

View:


```bash
tcpdump -s 0 -n -e -x -vvv -r app-traffic.pcap
```
    

Replay:


```bash
sudo tcpreplay -i en0 -t -K app-traffic.pcap
```
    

Or use tcplivereplay (Note: Linux only):
http://tcpreplay.synfin.net/wiki/tcpliveplay\#tcpliveplay

Result
------

I couldn’t get it to work….

