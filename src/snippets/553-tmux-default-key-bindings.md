---
id: '553'
title: Tmux default key bindings
languages:
- bash
tags:
---
Tmux key bindings:


```bash
Ctrl-b c Create new window
Ctrl-b d Detach current client
Ctrl-b l Move to previously selected window
Ctrl-b n Move to the next window
Ctrl-b p Move to the previous window
Ctrl-b & Kill the current window
Ctrl-b , Rename the current window
Ctrl-b % Split the current window into two panes
Ctrl-b q Show pane numbers (used to switch between panes)
Ctrl-b o Switch to the next pane
Ctrl-b ? List all keybindings

Ctrl-b n (Move to the next window)
Ctrl-b p (Move to the previous window)
Ctrl-b l (Move to the previously selected window)
Ctrl-b w (List all windows / window numbers)
Ctrl-b (Move to the specified window number, the default bindings are from 0 – 9)

Ctrl-b % (Split the window vertically)
Ctrl-b : “split-window” (Split window horizontally)
Ctrl-b : “break-pane” (Make pane its own window)
Ctrl-b o (Goto next pane)
Ctrl-b q (Show pane numbers, when the numbers show up type the key to goto that pane)
Ctrl-b { (Move the current pane left)
Ctrl-b } (Move the current pane right)

Ctrl-b : resize-pane (By default it resizes the current pane down)
Ctrl-b : resize-pane -U (Resizes the current pane upward)
Ctrl-b : resize-pane -L (Resizes the current pane left)
Ctrl-b : resize-pane -R (Resizes the current pane right)
Ctrl-b : resize-pane 20 (Resizes the current pane down by 20 cells)
Ctrl-b : resize-pane -U 20 (Resizes the current pane upward by 20 cells)
Ctrl-b : resize-pane -L 20 (Resizes the current pane left by 20 cells)
Ctrl-b : resize-pane -R 20 (Resizes the current pane right by 20 cells)
Ctrl-b : resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
Ctrl-b : resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)
```
    

From [here](http://blog.hawkhost.com/2010/06/28/tmux-the-terminal-multiplexer/)

