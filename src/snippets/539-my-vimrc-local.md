---
id: '539'
title: My ~/vimrc.local
languages:
tags:
---
For use with [Janus](https://github.com/carlhuda/janus):


```
" Position and maximize window
:winpos 0 0 " Center window
vsplit " Split window vertically
wincmd l  " Move to right window
split     " Split window horizontally

" Remove stuff
set guioptions-=L
"set guioptions-=r " Disable window resize
set guioptions-=T
set fuopt=maxvert,maxhorz " Maximize width and height
endif
```
    

