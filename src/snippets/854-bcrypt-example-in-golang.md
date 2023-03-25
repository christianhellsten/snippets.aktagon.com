---
id: '854'
title: bcrypt example in Golang
languages:
- go
tags:
---
```go
package main

import (
	"golang.org/x/crypto/bcrypt"
	"log"
	"os"
)

// NOTE: You need to escape the dollar signs in the hash with \
// HASH="xxx" PASSWORD=xxx go run main.go
func main() {
	hash, ok := os.LookupEnv("HASH")
	if !ok {
		log.Fatal("The HASH environment variable is not set")
	}
	password, ok := os.LookupEnv("PASSWORD")
	if !ok {
		log.Fatal("The PASSWORD environment variable is not set")
	}
	if isMatch(password, hash) {
		log.Printf("Match '%s' == '%s'", hash, password)
	} else {
		log.Printf("Mismatch '%s' != '%s'", hash, password)
	}
}

func isMatch(password string, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err == nil
}
```
