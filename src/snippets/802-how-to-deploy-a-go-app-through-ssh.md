---
id: '802'
title: How to deploy a Go app through SSH
languages:
- bash
tags:
---
```bash
# Target = Linux
GOARCH=amd64 GOOS=linux go build -o dist/go-fcuk-linux
scp dist/go-fcuk 127.0.0.1:/tmp
ssh -t 127.0.0.1 "sudo mv /tmp/go-fcuk-linux /usr/local/bin/go-fcuk"
```
