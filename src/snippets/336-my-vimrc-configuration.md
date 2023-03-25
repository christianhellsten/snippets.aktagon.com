---
id: '336'
title: My .vimrc configuration
languages:
tags:
---

```
set guifont=Monaco:h12

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let leader = ","

set grepprg=ack
set grepformat=%f:%l:%m

set hidden
set history=1000
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent
set ignorecase
set smartcase
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ruler
set number
set hlsearch
set incsearch " ...dynamically as they are typed.
set visualbell

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

runtime macros/matchit.vim

autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab

syntax on
filetype on
filetype plugin on
filetype indent on

let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

map ,d :execute 'NERDTreeToggle ' . getcwd()<CR>
map ,t :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
map ,f gg=G

set columns=160                                                     "set width of window off open
set lines=50                                                        "height of window off open

set gcr=a:blinkwait500-blinkon1300-blinkoff150                      "tune the blinking of the cursor, short on, long off.
set gcr=i:hor10                                                     "underline cursor. not too thick not too thin. goldielocks style
set gcr=v:block                                                     "selecting should cover the text

map ,c :ruby finder.rescan!

set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode
```
    

