---
id: '331'
title: 'Bash scripting: change current Rails application directory'
languages:
- bash
tags:
- docker
- registry
- self-signed
---
Put this in ~/.bashrc:


```bash
app () { cd "/var/www/$*/current"; }
```
    

Execute:


```bash
. ~/.bashrc
```
    

Now you can change to another Rails app directory like this:


```bash
app xxx.com
```
    

