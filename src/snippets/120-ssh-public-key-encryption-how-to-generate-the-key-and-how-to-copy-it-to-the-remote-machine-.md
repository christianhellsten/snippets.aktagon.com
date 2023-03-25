---
id: '120'
title: 'SSH public key encryption - How to generate the key and how to copy it to
  the remote machine '
languages:
- bash
tags:
---

```bash
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | ssh user@machine "cat >> ~/.ssh/authorized_keys"
```
    

