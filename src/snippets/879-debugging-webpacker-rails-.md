---
id: '879'
title: Debugging Webpacker (Rails)
languages:
- bash
tags:
---
If Webpacker fails to compile your Javascripts without including any output:

```bash
[Webpacker] Compiling…
[Webpacker] Compilation failed:
```

Try running webpacker from the command line:

```bash
$ ./bin/webpack --progress --profile
```
