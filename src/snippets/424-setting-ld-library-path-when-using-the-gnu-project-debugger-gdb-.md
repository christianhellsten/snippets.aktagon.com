---
id: '424'
title: Setting LD_LIBRARY_PATH when using the Gnu Project Debugger (gdb)
languages:
- bash
tags:
- docker
- dockerfile
- rails
- ruby
---
If you get this:


```bash
ImportError: lpthread.so: cannot open shared object file: No such file or directory
```
    

Do this:


```bash
set environment LD_LIBRARY_PATH=directory where lpthread.so is
```
    

The reason for this problem is that gdb doesn't use the same settings as your session so specifying LD\_LIBRARY\_PATH in your bash session won't work.

