---
id: '668'
title: Automatic Code Folding/Collapsing in Vim for Ruby
languages:
tags:
---
Add this to your .vimrc to enable automatic code folding for Ruby comments:


```
" Enable automatic code folding for Ruby
autocmd FileType ruby,eruby
      \ set foldmethod=expr |
      \ set foldexpr=getline(v:lnum)=~'^\\s*#'
```
    

Open and close folds with zo and zc.

See **:help folding** for details.

[Automatically fold comments in Vim](http://travisjeffery.com/b/2012/01/automatically-fold-comments-in-vim/)

