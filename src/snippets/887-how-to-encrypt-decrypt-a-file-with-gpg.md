---
id: '887'
title: How to encrypt/decrypt a file with GPG
languages:
- bash
tags:
---
First, install GPG:

```bash
brew install gpg
```

To encrypt a file with GPG, run:

```bash
gpg -c secrets.txt
```

To decrypt the encrypted and password-protected GPG file, run:

```bash
gpg secrets.txt.gpg
```
