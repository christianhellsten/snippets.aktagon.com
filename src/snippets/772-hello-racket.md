---
id: '772'
title: Hello Racket
languages:
- racket
tags:
---
## Install Racket

Install racket:
```
brew cask install racket
```

Do NOT use *brew install racket*, because it will install the minimal-racket distribution which is missing a lot of tools and packages.

## Write Hello World

```racket
#lang racket
;;
;; From the command line:
;;
;;  $ racket -it multiply.rkt
;;
;; Export multiply function so that we can call it from the REPL
;;
(provide multiply)

;;
;; Define the multiply method
;;
(define (multiply number n)
  (* number n))

;;
;; Execute function
;;
(multiply 1 2)
(multiply 2 3)

;;
;; Write a unit test for the multiply method
;;
(module+ test
  (require rackunit)
  (check-equal? (multiply 0 0) 0)
  (check-equal? (multiply 2 2) 4))
```
