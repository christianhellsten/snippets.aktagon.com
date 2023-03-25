---
id: '131'
title: How to install fink on Mac OSX Leopard
languages:
- bash
tags:
- elixir
- file
- logging
---

```bash
http://downloads.sourceforge.net/fink/fink-0.27.8.tar.gz
tar zxvf fink*
cd fink*

# Run following command, and answer the questions to your best knowledge, use defaults if uncertain
./bootstrap /sw

source /sw/bin/init.sh 

fink selfupdate
```
    

