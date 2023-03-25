---
id: '503'
title: 'SSH "bundle: command not found"'
languages:
- bash
tags:
---
Behold ~/.bashrc:


```bash
# If not running interactively, don't do anything 
[ -z "$PS1" ] && return
```
    

Don't put "export PATH" or anything else important below that line containing "return", put it above.

If you're using SSH to execute commands on the server the script will exit on that line, and with Rails bundler you'll then get errors like this:


```bash
bash: bundle: command not found
```
    

Still not working? Maybe you're running the command through SSH and bundle (or rbenv/rvm) is not in your PATH variable:


```bash
$ ssh sandbox 'echo $PATH'
```
    

Now try this:


```bash
$ ssh sandbox 'source ~/.bashrc && echo $PATH'
```
    

Next, figure out why the command is not in your path.

It could be because your .bashrc is missing this:


```bash
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
```
    

It could be something else…

