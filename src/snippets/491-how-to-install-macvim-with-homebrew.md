---
id: '491'
title: How to install MacVim with Homebrew
languages:
- bash
tags:
- join
- python
- uri
- url
---

```bash
brew install -v macvim --no-icons
mv /usr/local/Cellar/macvim/snapshot-55/MacVim.app /Applications/
```
    

The --no-icons switch is a fix for:


```bash
PhaseScriptExecution "Make Document Icons" /tmp/...
(1 failure)
```
    

