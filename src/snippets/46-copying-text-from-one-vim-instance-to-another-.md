---
id: '46'
title: 'Copying text from one VIM instance to another '
languages:
tags:
---
Copying and pasting text between two VIM instances messes up the indentation in a very annoying way. To avoid this problem first run this VIM command:


```
:set paste
```
    

After you have pasted the code, run this command:


```
:set nopaste
```
    

