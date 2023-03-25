---
id: '839'
title: HTTP and HTTPS client example in Racket
languages:
- racket
tags:
---
```racket
; HTTP example
(require net/http-client)
(http-sendrecv "google.com" "/" #:port 80)

; HTTPS example
(require net/http-client)
(http-sendrecv "google.com" "/" #:port 443 #:ssl? 'tls)
```
