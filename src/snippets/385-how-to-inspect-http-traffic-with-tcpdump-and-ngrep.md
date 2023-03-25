---
id: '385'
title: How to inspect HTTP traffic with tcpdump and ngrep
languages:
- bash
tags:
- lol
- migration
- rails
- wtf
---
## ngrep

ngrep is one alternative to tcpdump:

```bash
$ sudo ngrep -q -d lo0 -W byline host localhost and dst port 3002
```

The command will listen to interface lo0 and print all traffic destined for localhost port 3002.

## tcpdump

Write traffic on port 80 (HTTP) to a file. Rotate log file after 10Mb. Keep 5 files.


```bash
$ sudo tcpdump port 80 -n -i any -w /tmp/traffic -p -C 10 -W 5 -s 1500
```
    

[This gist shows how to monitor HTTP requests](http://gist.github.com/90062).

On OSX remember to install tcpdump with brew:


```bash
$ brew install tcpdump
```

