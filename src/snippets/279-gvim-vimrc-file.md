---
id: '279'
title: GVim _vimrc file
languages:
tags:
---

```
set history=100

let mapleader = ","
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent


autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab


set number
set hlsearch
syntax on

let g:fuzzy_trim_length = 3000
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

map ,t :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>

map ,d :execute 'NERDTreeToggle ' . getcwd()<CR>

set guifont=Bitstream\ Vera\ Sans\ Mono:h9

au GUIEnter * simalt ~x

colorscheme railscasts
" set guifont=consolas:h8
```
    

