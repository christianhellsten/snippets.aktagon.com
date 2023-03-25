---
id: '184'
title: A proper vim setup
languages:
- bash
tags:
---
Out-of-the-box vim setup is good, but with a few tweaks it gets much better. Install the full version instead of the minimal and also [exuberant ctags](http://ctags.sourceforge.net/), which are great for programmers using vim. They let you navigate in the source code like you do in a full fledged IDE.


```bash
sudo apt-get install vim exuberant-ctags
```
    

Then place the content below into your ~/.vimrc file.


```bash
set nocompatible
syntax on
filetype plugin indent on
runtime! macros/matchit.vim
set autoindent          " always set autoindenting on
set smartindent         " smartindent! :)
set nobackup " nobackup
:colorscheme oceandeep
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END


" minibufexplorer options
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1




" Add the contents of this file to your ~/.vimrc file
"
" Crucual setting, set to the dir in which your ruby projects reside

let base_dir = "/work/aktagon/rails" . expand("%")

" Central additions (also add the functions below)

:command RTlist call CtagAdder("app/models","app/controllers","app/views","public")

map <F7> :RTlist<CR>

" Optional, handy TagList settings

:nnoremap <silent> <F8> :Tlist<CR>

let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1

let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

let Tlist_WinWidth = 40

" Function that gets the dirtrees for the provided dirs and feeds 
" them to the TlAddAddFiles function below

func CtagAdder(...)
	let index = 1
	let s:dir_list = ''
	while index <= a:0
		let s:dir_list = s:dir_list . TlGetDirs(a:{index})
		let index = index + 1
	endwhile
	call TlAddAddFiles(s:dir_list)
	wincmd p
	exec "normal ="
	wincmd p
endfunc 

" Adds *.rb, *.rhtml and *.css files to TagList from a given list
" of dirs

func TlAddAddFiles(dir_list)
	let dirlist = a:dir_list
	let s:olddir = getcwd()
	while strlen(dirlist) > 0
		let curdir = substitute (dirlist, '|.*', "", "")
		let dirlist = substitute (dirlist, '[^|]*|\?', "", "")
		exec "cd " . g:base_dir
		exec "TlistAddFiles " . curdir . "/*.rb"
		exec "TlistAddFiles " . curdir . "/*.rhtml"
		exec "TlistAddFiles " . curdir . "/*.css"
"		exec "TlistAddFiles " . curdir . "/*.js"
	endwhile
	exec "cd " . s:olddir
endfunc

" Gets all dirs within a given dir, returns them in a string,
" separated by '|''s

func TlGetDirs(start_dir)
	let s:olddir = getcwd()
	exec "cd " . g:base_dir . '/' . a:start_dir
	let dirlist = a:start_dir . '|'
	let dirlines = glob ('*')
	let dirlines = substitute (dirlines, "\n", '/', "g")
	while strlen(dirlines) > 0
		let curdir = substitute (dirlines, '/.*', "", "")
		let dirlines = substitute (dirlines, '[^/]*/\?', "", "")
		if isdirectory(g:base_dir . '/' . a:start_dir . '/' . curdir)
			let dirlist = dirlist . TlGetDirs(a:start_dir . '/' . curdir)
		endif
	endwhile
	exec "cd " . s:olddir
	return dirlist
endfunc
```
    

