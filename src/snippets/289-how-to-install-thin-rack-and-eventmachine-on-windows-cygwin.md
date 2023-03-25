---
id: '289'
title: How to install thin, rack and eventmachine on Windows/Cygwin
languages:
- bash
tags:
- activerecord
- isolation
- postgres
- rails
- read-commited
- repeatable-read
- transaction
---
There's no official Windows binary release of eventmachine for the latest version of thin (1.0.0). Thin needs at least version (0.12.2) of eventmachine, so you'll have to use the latest GitHub code (currently 0.12.3) to install thin on Windblows and CygWin:


```bash
git clone git://github.com/eventmachine/eventmachine.git
cd eventmachine
rake gem
gem install pkg/eventmachine-0.12.3.gem
gem install thin rack
```
    

