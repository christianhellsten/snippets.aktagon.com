---
id: '844'
title: Inspecting a live Ruby process
languages:
- bash
tags:
---
Inspecting a live Ruby process:

On Linux:
```bash
strace -p <pid> 
```

On Mac:
```bash
dtruss -p <pid> 
```

```bash
gdb -p <pid> 
(gdb) t a a bt 
(gdb) call (void)rb_backtrace() 
```

See https://blog.newrelic.com/engineering/debugging-stuck-ruby-processes-what-to-do-before-you-kill-9/
