---
id: '537'
title: How to fix Sphinx error "unknown local index <xxx> in search request"
languages:
- bash
tags:
- alt
- grep
- '"key bindings"'
- ruby
- space
- whitespace
---
If you get this:


```bash
"unknown local index <xxx> in search request"
```
    

Do this:


```bash
rake ts:rebuild
```
    

