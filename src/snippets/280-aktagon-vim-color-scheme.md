---
id: '280'
title: Aktagon vim color scheme
languages:
tags:
---

```
" Vim color scheme
"
" Name:         aktagon.vim
" Maintainer:   Christian Hellsten 
" Last Change:  17 December 2008
" License:      public domain
" Version:      1.0
"
" Based on http://www.vim.org/scripts/script.php?script_id=1995
"

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "aktagon"

if has("gui_running")
  hi link htmlTag                     xmlTag
  hi link htmlTagName                 xmlTagName
  hi link htmlEndTag                  xmlEndTag

  highlight Normal                    guifg=#E6E1DC   guibg=#2B2B2B
  highlight Cursor                    guifg=#000000   guibg=#FFFFFF
  "highlight CursorLine               guibg=#323300
 
  highlight Comment                   guifg=#BC9458   gui=italic
  highlight Constant                  guifg=#6D9CBE
  highlight Define                    guifg=#CC7833
  highlight Error                     guifg=#FFFFFF   guibg=#990000
  highlight Function                  guifg=#FFC66D   gui=NONE
  highlight Identifier                guifg=#6D9CBE   gui=NONE
  highlight Include                   guifg=#CC7833   gui=NONE
  highlight Keyword                   guifg=#CC7833
  hi        LineNr		                guifg=#888888   ctermfg=lightMagenta

  highlight Number                    guifg=#A5C261
  highlight PreProc                   guifg=#E6E1DC
  highlight Search                    guibg=#FFFF00
  highlight Statement                 guifg=#CC7833   gui=NONE
  highlight String                    guifg=#A5C261
  highlight Title                     guifg=#FFFFFF
  highlight Type                      guifg=#DA4939   gui=NONE
  highlight Visual                    guibg=#5A647E
  
  highlight DiffAdd                   guifg=#E6E1DC   guibg=#144212
  highlight DiffDelete                guifg=#E6E1DC   guibg=#660000
  
  highlight rubyBlockParameter        guifg=#FFFFFF
  highlight rubyClass                 guifg=#FFFFFF
  highlight rubyConstant              guifg=#DA4939
  highlight rubyInstanceVariable      guifg=#D0D0FF
  highlight rubyInterpolation         guifg=#519F50
  highlight rubyLocalVariableOrMethod guifg=#D0D0FF
  highlight rubyPredefinedConstant    guifg=#DA4939
  highlight rubyPseudoVariable        guifg=#FFC66D
  highlight rubyStringDelimiter       guifg=#A5C261
  
  highlight xmlTag                    guifg=#E8BF6A
  highlight xmlTagName                guifg=#E8BF6A
  highlight xmlEndTag                 guifg=#E8BF6A
endif


" Fuzzy Finder popup
hi Pmenu           guibg=#FFFFFF guifg=#000000
hi PMenuSel        guibg=#242424 guifg=#FFFFFF gui=bold
hi PmenuSbar       guibg=#2e3330 guifg=#000000
hi PMenuThumb      guibg=#a0afa0 guifg=#040404
```
    

