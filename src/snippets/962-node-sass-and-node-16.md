---
id: '962'
title: node-sass and node 16
languages:
- bash
tags:
---
Autumn, 2021: node-sass does not support node v16:

> error: no template named 'remove_cv_t'

```bash
brew install node@14
brew unlink node
brew link node@14
node -v
spring stop
yarn install
```
