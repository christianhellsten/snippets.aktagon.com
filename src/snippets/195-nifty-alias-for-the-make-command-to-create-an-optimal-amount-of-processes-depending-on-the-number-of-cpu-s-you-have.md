---
id: '195'
title: Nifty alias for the make command to create an optimal amount of processes depending
  on the number of CPU's you have
languages:
- bash
tags:
---
Put this in your ~/.bashrc to automatically adjust the number of processes make creates. This snippet is licensed under the [beerware license](http://en.wikipedia.org/wiki/Beerware).


```bash
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# < marko haapala at aktagon com > wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------
alias make="make -j$(cat /proc/cpuinfo |grep processor | wc -l)"
```
    

