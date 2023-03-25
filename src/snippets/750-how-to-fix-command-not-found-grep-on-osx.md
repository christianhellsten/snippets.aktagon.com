---
id: '750'
title: 'How to fix "command not found:  grep" on OSX'
languages:
- bash
tags:
---
This issue will bite everyone who touches a keyboard. This fixes, e.g., the following issues:
\* command not found:  grep (Shell)
\* undefined local variable or method (Ruby)
\* <your key-binding related issue here>

First, do this:


```bash
mkdir -p ~/Library/KeyBindings/
vim ~/Library/KeyBindings/DefaultKeyBinding.dict
```
    

Then paste this:


```bash
{
  "~ " = ("insertText:", " ");
}
```
    

Save the file.

Quit and reopen applications to apply the new key bindings in DefaultKeyBinding.dict.

References
----------

<http://osxnotes.net/keybindings.html>
<http://linuxtoosx.blogspot.fi/2010/10/disabling-option-space-and-altgr-space.html>

MacVim
------

For MacVim i have yet to find a solution for insert mode, so just use vim in the terminal...

