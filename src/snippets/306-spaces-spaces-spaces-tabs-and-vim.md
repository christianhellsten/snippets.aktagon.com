---
id: '306'
title: Spaces, spaces, spaces, tabs and VIM
languages:
tags:
---
Convert tabs to spaces:


```
:set expandtab
:%retab!
```
    

Convert spaces to tabs


```
set noexpandtab
:%retab!
```
    

Re-tab all buffers:


```
:retab sball
```
    

