---
id: '920'
title: SCP via an SSH jump host
languages:
- bash
tags:
---
I prefer using rsync to scp when copying files via jump hosts, for example, to **target-host** via the intermediate host **jump-host**:

```bash
rsync -v -e 'ssh -A -t user@jump-host ssh -A -t target-host' nasty.file :/tmp
```

rsync syntax is stable across versions and platforms while the syntax of SCP is different across platforms and versions.

man ssh:

```bash
     -A      Enables forwarding of the authentication agent connection.  This can also be specified on a per-host basis in a configuration
             file.

             Agent forwarding should be enabled with caution.  Users with the ability to bypass file permissions on the remote host (for the
             agent's UNIX-domain socket) can access the local agent through the forwarded connection.  An attacker cannot obtain key material
             from the agent, however they can perform operations on the keys that enable them to authenticate using the identities loaded into
             the agent.
             
     -t      Force pseudo-terminal allocation.  This can be used to execute arbitrary screen-based programs on a remote machine, which can be
             very useful, e.g. when implementing menu services.  Multiple -t options force tty allocation, even if ssh has no local tty.
```
             
