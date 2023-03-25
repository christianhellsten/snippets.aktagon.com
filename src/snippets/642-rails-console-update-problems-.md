---
id: '642'
title: Rails Console Update Problems?
languages:
- bash
tags:
---
Console not updating when typing? Pry/Ruby/Rails/something messing up console output? Check your stty settings:


```bash
stty -a
```
    

Is echo disabled. Do you see "-echo" in the output?

Try resetting the console:


```bash
reset
# or
stty
```
    

Check if you have incorrectly colorized output:
<http://stackoverflow.com/questions/8806643/colorized-output-breaks-linewrapping-with-readline/8916332#8916332>

Are you using a gem or something else that colorizes console output? Try disabling them.

Examples:
\* [turn](https://github.com/turn-project/turn)
\* [pry-theme](https://github.com/kyrylo/pry-theme)

See:
<http://askubuntu.com/questions/171449/shell-does-not-show-typed-in-commands-reset-works-but-what-happened>

