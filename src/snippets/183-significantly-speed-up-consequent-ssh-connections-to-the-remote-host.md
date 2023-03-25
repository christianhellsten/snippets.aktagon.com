---
id: '183'
title: Significantly speed up consequent ssh connections to the remote host
languages:
- bash
tags:
- clipboard
- osx
- vim
- yank
---
Achieve **major** speed up of e.g scp tab completions or other consequent connections to the same server by using ControlMaster. Append these rows into ~/.ssh/config


```bash
Host *
ControlMaster auto
ControlPath ~/.ssh/.sock_%r@%h:%p
```
    

