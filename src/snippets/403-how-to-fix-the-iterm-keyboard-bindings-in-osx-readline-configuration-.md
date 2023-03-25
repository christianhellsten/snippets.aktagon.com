---
id: '403'
title: How to fix the iTerm keyboard bindings in OSX (readline configuration)
languages:
- bash
tags:
---
The keyboard bindings in iTerm on OSX Snow Leopard are fubar. To fix them either switch to Linux or put this in your zsh configuration:


```bash
bindkey "^r" history-incremental-search-backward
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey 'ƒ'  forward-word
bindkey '›'  backward-word
bindkey "^F" forward-char
bindkey "^B" backward-char
bindkey "^k" kill-line
bindkey "^u" backward-kill-line
```
    

