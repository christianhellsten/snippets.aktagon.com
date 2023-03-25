---
id: '42'
title: Automatically giving predetermined answers to a program.
languages:
- bash
tags:
- browserify
- es6
- jsx
- react
---
Sometimes you want to automate the running of a script or program, but the darn thing keeps asking questions and expects interactive answers. Shell scripting makes it easy to give the answers automatically, using a stream redirection from a file.


```bash
./qurious_program < predetermined_answers.txt
```
    

