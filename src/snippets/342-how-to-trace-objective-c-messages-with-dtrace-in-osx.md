---
id: '342'
title: How to trace Objective-C messages with dtrace in OSX
languages:
- objectivec
tags:
- docker
- kubernetes
- macos
---
First, find the process id:


```objectivec
$ ps -ef|grep Grab
  501 50335   319   0   0:02.11 ??         0:04.40 /Applications/Utilities/Grab.app/Contents/MacOS/Grab -psn_0_7309048
```
    

The pid is 50335 so create a D program that captures the Objective-C calls for that process:


```objectivec
objc50335:::entry
{
   printf("%s %s\n", probemod, probefunc);
}
```
    

Save the code in a file called grab.trace.d and start tracing by executing this command:


```objectivec
sudo dtrace -s grab.trace.d > trace.log
```
    

Output is sent to the trace.log file.

