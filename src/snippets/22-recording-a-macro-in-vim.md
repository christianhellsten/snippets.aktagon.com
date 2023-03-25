---
id: '22'
title: Recording a macro in vim
languages:
- bash
tags:
---
Vim is a powerful text editor. All powerful text editors support some kind of macro's. Here's how vim does it.


```bash
qa - start recording a macro into register 'a'
q - stop recording
```
    

Running the macro.


```bash
@a - run the macro in register 'a'
@@ - repeat the last macro that was run
10@a - run the macro in register 'a' ten times
```
    

