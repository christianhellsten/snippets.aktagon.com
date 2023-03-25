---
id: '504'
title: How to generate screenshots on Debian Linux with python-webkit2png
languages:
- bash
tags:
---
Install:


```bash
apt-get install python-qt4 libqt4-webkit
git clone git://github.com/adamn/python-webkit2png.git
cd python-webkit2png/
python setup.py install
```
    

Test:


```bash
./webkit2png.py www.google.com
```
    

You might get this error:


```bash
webkit2png.py: cannot connect to X server
```
    

Fix:


```bash
# install xvbf
apt-get install xvfb xbase-clients xfonts-base libgtk2.0-0
# start
Xvfb :99 -ac
```
    

See details [here](http://www.bitwiseim.com/wiki/index.php?title=Trick:_Headless_Routing_Server#Installing_Required_Files)

Take a screenshot:


```bash
./webkit2png.py -o obama.png -x 1024 768 "http://obama.com"
```
    

On OSX I would recommend you use [Paparazzi](http://derailer.org/paparazzi/)

