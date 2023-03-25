---
id: '386'
title: How to implement copy-to-clipboard functionality that works with Flash 10
languages:
tags:
---
Use mojombo's [Clippy](http://github.com/mojombo/clippy) which can be downloaded from GitHub.

How to create a custom button
-----------------------------

-   First create your button and save it as a PNG file.
-   Change library.xml to use your button.
-   Customize the code behind the button by modifying clippy.hx. You can, for example, remove the "Copy to clipboard" label.
-   Set the width and height of the button. You have to set it in almost all files (compile.hxml, library.xml, etc).
-   Compile the SWF file:


```
swfmill simple library.xml library.swf && haxe compile.hxml
```
    

Alternatives
------------

There are no good alternatives that I know of. I tried ZeroClipboard and other solutions, but they were full of bugs and not customizable.

