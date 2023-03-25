---
id: '815'
title: How to use nmap to find security vulnerabilities
languages:
- bash
tags:
---
```bash
$ brew install nmap
$ cd /usr/local/share/nmap/scripts
$ git clone git@github.com:scipag/vulscan.git
$ nmap -sV -A -oX nmap-report.xml --script=vulscan/vulscan.nse snippets.aktagon.com
$ xsltproc nmap-report.xml -o nmap-report.html
```

  - sV: Probe open ports to determine service/version info
  - A: Enable OS detection, version detection, script scanning, and traceroute

Also see:
https://nmap.org/
https://github.com/scipag/vulscan
http://www.openvas.org/
https://observatory.mozilla.org/
