---
id: '550'
title: 'Git: "fatal: protocol error: bad line length character:"'
languages:
- bash
tags:
- dependencies
- foreman
- overmind
- procfile
- sleep
---
Git might give you this fine error


```bash
fatal: protocol error: bad line length character:
```
    

Looks like git didn't receive the response it expected from your server.

Possible causes:
\* Did you put some echo commands in e.g. ~/.bashrc on the remote server?

