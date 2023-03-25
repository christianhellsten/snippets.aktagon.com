---
id: '187'
title: Fix for empty ident error using older git
languages:
- bash
tags:
---
[In this snippet](http://snippets.aktagon.com/snippets/157-Installing-compiling-and-using-git-with-Ruby-on-Rails-on-Mac-OS-X-Leopard-and-Debian-Linux-) Christian explains how to fix the empty ident error using a bleeding edge git. In older git versions this must be done manually. So if you get this error...


```bash
*** Environment problem:
*** Your name cannot be determined from your system services (gecos).
*** You would need to set GIT_AUTHOR_NAME and GIT_COMMITTER_NAME
*** environment variables; otherwise you won't be able to perform
*** certain operations because of "empty ident" errors.
*** Alternatively, you can use user.name configuration variable.

fatal: empty ident  <.....@......com> not allowed
```
    

... then add the following parameters to your <sub>/.bashrc\\ file\\ and\\ source\\ it\\ with\\ .</sub>/.bashrc (or relogin, alternatively):


```bash
export GIT_AUTHOR_NAME="Marko Haapala"
export GIT_COMMITTER_NAME="Marko Haapala"
```
    

