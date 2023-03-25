---
id: '13'
title: Screenshot in wmii
languages:
- bash
tags:
---
Method 1
--------

A simple script to create a screenshot in wmii. It probably works in other window managers too. I call it 'scrot'. Put it in the path and run it as you'd run any program in wmii. The "import" program comes with imagemagick.


```bash
#!/bin/bash
import -window root /tmp/screenshot.png
```
    

Method 2
--------

If you want timestamped screenshots then


```bash
apt-get install scrot
mkdir -p ~/screenshots
```
    

And create a script with the following content for making the screenshot.


```bash
#!/bin/bash
scrot '%Y-%m-%d-%H-%M-%S_$wx$h_scrot.png' -e 'mv $f ~/screenshots'
```
    

