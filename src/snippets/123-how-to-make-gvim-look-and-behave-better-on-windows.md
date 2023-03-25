---
id: '123'
title: How to make GVim look and behave better on Windows
languages:
tags:
---
I use this configuration with GVim (sometimes I'm forced to use Windows). It makes the GVim behave and look better.


```
" Start maximized
au GUIEnter * simalt ~x

" Use CUA keystrokes for clipboard: CTRL-X, CTRL-C, CTRL-V and CTRL-z
source $VIMRUNTIME/mswin.vim

syntax on
set nocompatible
filetype on
filetype indent on
filetype plugin on

" General options
set incsearch
set ignorecase smartcase 

" Use two space tabs
set tabstop=2
set shiftwidth=2
set expandtab

" No menus and no toolbar
"set guioptions-=m  
set guioptions-=T

set guifont=Consolas:h11:cANSI

highlight Normal guifg=White   guibg=Black
highlight Cursor guifg=Black   guibg=White
highlight Keyword guifg=#FF6600
highlight Define guifg=#FF6600
highlight Comment guifg=#9933CC
highlight Type guifg=White gui=NONE
highlight rubySymbol guifg=#339999 gui=NONE
highlight Identifier guifg=White gui=NONE
highlight rubyStringDelimiter guifg=#66BB00
highlight rubyInterpolation guifg=White
highlight rubyPseudoVariable guifg=#339999
highlight Constant guifg=#FFEE98
highlight Function guifg=#FFCC00 gui=NONE
highlight Include guifg=#FFCC00 gui=NONE
highlight Statement guifg=#FF6600 gui=NONE
highlight String guifg=#66BB00
highlight Search guibg=White

function RubyEndToken ()
  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) >= 0
    return "\<CR>}\<C-O>O" 
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O" 
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O" 
  else
    return "\<CR>" 
  endif
endfunction

function UseRubyIndent ()
  setlocal tabstop=8
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal expandtab

  imap <buffer> <CR> <C-R>=RubyEndToken()<CR>
endfunction

autocmd FileType ruby,eruby call UseRubyIndent()
```
    

