---
id: '928'
title: 'Testing network connections on Linux without '
languages:
- bash
tags:
---
This works on Linux if "/dev/tcp" is not disabled:

```bash
$ cat < /dev/tcp/google.com/80
```

If the connection is opened successfully the command will wait for input, i.e., nothing will happen. If the port is closed you will get an error.

See:

https://news.ycombinator.com/item?id=3609061

http://tmartiro.blogspot.com/2012/02/udptcp-connection-using-pure-bash.html
