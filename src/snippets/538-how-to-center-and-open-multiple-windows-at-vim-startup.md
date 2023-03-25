---
id: '538'
title: How to center and open multiple windows at Vim startup
languages:
tags:
---
For maximum productivity I like to split the Vim window into 3 viewports. The main viewport is to the left and two viewports to the right. I also like to maximize the Vim window. Put this in your ~/.vimrc configuration file to make Vim use this setup by default at startup:


```
set columns=180
set lines=180

:winpos 50 50 " Center window
vsplit    " Split window vertically. e.g. 100vsplit
wincmd l  " Move to right window
split     " Split window horizontally
```
    

