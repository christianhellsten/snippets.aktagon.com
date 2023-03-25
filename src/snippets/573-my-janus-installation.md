---
id: '573'
title: My Janus Installation
languages:
tags:
---
.vimrc.before:


```
"call janus#disable_plugin('nerdcommenter')
let mapleader = ","

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

map <C-h> 5<C-w>>
map <C-j> 5<C-w><
map <C-k> 3<C-w>+
map <C-l> 3<C-w>-
map <leader><leader> :ZoomWin<cr>

set undofile
set undodir=~/.vimundo/

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*,*/vendor/bundle/*

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30

" No wrapping
set nowrap
set textwidth=0 wrapmargin=0

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    if &ft =~ '\|ruby\|javascript\|perl'
        return
    endif
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
```
    

Optional .gvimrc.after:


```
colorscheme jellybeans
" colorscheme molokai
"colorscheme vibrantink
set guifont=Monaco:h13

" Position and maximize window
:winpos 0 0 " Center window
vsplit " Split window vertically
wincmd l  " Move to right window
split     " Split window horizontally
set fuopt=maxvert,maxhorz  " Maximize

" Remove stuff
set guioptions-=L
"set guioptions-=r " Disable window resize
set guioptions-=T
```
    

Optional .vimrc.after:


```
colorscheme vibrantink
```
    

