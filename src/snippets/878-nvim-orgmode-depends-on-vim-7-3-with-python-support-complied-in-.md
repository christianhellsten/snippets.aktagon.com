---
id: '878'
title: 'nvim: "Orgmode depends on Vim >= 7.3 with Python support complied in"'
languages:
- vim
tags:
---
Try specifying the path to python in vimrc:

```vim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
```

Also try running the **:checkhealth** nvim command.
