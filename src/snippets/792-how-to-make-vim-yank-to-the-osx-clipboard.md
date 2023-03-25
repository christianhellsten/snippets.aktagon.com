---
id: '792'
title: How to make Vim yank to the OSX clipboard
languages:
- bash
- vim
tags:
---
Add this to .vimrc:
```vim
set clipboard=unnamed
```

If you use Tmux you probably need this:
https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

```bash
$ brew install reattach-to-user-namespace
```

Note, do NOT use something like this because it doesn't work perfectly:
```vim
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
```

