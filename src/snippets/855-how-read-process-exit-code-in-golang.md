---
id: '855'
title: How read process exit code in Golang
languages:
- go
tags:
---
This function returns true if the nz command returns exit code 0:

```go
package main

import (
	"os/exec"
	"strconv"
)

// IsPortOpen returns a boolean that indicates whether a port is open or closed.
func IsPortOpen(host string, port int) bool {
	args := []string{"-z", host, strconv.Itoa(port), "-G", "5"}
	cmd := exec.Command("/usr/bin/nc", args...)
	_, err := cmd.Output()
	if werr, ok := err.(*exec.ExitError); ok {
		if s := werr.Error(); s != "0" {
			return false
		}
	}
	return true
}
```
