---
id: '702'
title: Debugging Vim Slowness
languages:
- bash
tags:
---
To print Vim's startup time:


```bash
$ vim --startuptime /dev/stdout +qall
```
    

Note that this was tested on Vim 7.3.

If you have compiled Vim with profiling enabled ([brew install macvim doesn't](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/macvim.rb)):


```bash
$ vim --version | grep +profile
```
    

Then you can profile Vim commands as described in this article:
<https://coderwall.com/p/sdva9q/how-to-detect-plugins-slowing-vim-down>

