---
id: '985'
title: Mounting configuration files in Podman
languages:
- bash
tags:
---
Is **podman run** giving you the following error when mounting, for example, a configuration file as a volume?

```bash
podman run --name=haproxy ... -v /Users/christian/projects/nyse/config/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro --net ...
Error: statfs /Users/christian/projects/nyse/config/haproxy.cfg: no such file or directory
...
```

To fix the problem, tell podman to mount the root directory when creating the virtual machine:

```bash
$ podman machine init -v /Users/christian:/Users/christian
```

For details, see:
https://docs.podman.io/en/latest/markdown/podman-machine-init.1.html
