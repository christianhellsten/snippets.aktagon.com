---
id: '676'
title: Web Microframework Benchmark
languages:
tags:
---
Results on an old MacBook Air:


```
Ruby 2.1.0 + Hobbit + Hat + puma (-t 8 -w 2) - ~100-150 req/s (Hat = Hobbit app template with i18n, asset pipeline, etc)
Ruby 2.1.0 + Hobbit + Hat custom + puma (-t 8 -w 2) - ~1500 req/s (Hat without asset pipeline)
Ruby 2.1.0 + Hobbit + puma (-t 8 -w 2) - ~1600 req/s
Ruby 2.1.0 + rack + puma (-t 8 -w 2) - ~1600 req/s
Golang 1.3.1 + net/http - ~2700 req/s
Elixir 1.0.0 + Phoenix 0.4.1 - ~1300 req/s
Clojure 1.6.0 + ring 1.3.1 - ~5000 req/s
Clojure 1.6.0 + ring 1.3.1 + slim - ~270 req/s
```
    

YMMV.

