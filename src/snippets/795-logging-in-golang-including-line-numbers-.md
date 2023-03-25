---
id: '795'
title: Logging in Golang (including line numbers)
languages:
- bash
- go
tags:
---
## Features

- Prints location of errors including line number
- Debug mode

## Code

```go
var debug bool

func init() {
	debug = os.Getenv("DEBUG") != ""
}

// Info example:
//
// Info("timezone %s", timezone)
//
func Info(msg string, vars ...interface{}) {
	log.Printf(strings.Join([]string{"[INFO ]", msg}, " "), vars...)
}

// Debug example:
//
// Debug("timezone %s", timezone)
//
func Debug(msg string, vars ...interface{}) {
	if debug {
		log.Printf(strings.Join([]string{"[DEBUG]", msg}, " "), vars...)
	}
}

// Fatal example:
//
// Fatal(errors.New("db timezone must be UTC"))
//
func Fatal(err error) {
	pc, fn, line, _ := runtime.Caller(1)
	// Include function name if debugging
	if debug {
		log.Fatalf("[FATAL] %s [%s:%s:%d]", err, runtime.FuncForPC(pc).Name(), fn, line)
	} else {
		log.Fatalf("[FATAL] %s [%s:%d]", err, fn, line)
	}
}

// Error example:
//
// Error(errors.Errorf("Invalid timezone %s", timezone))
//
func Error(err error) {
	pc, fn, line, _ := runtime.Caller(1)
	// Include function name if debugging
	if debug {
		log.Printf("[ERROR] %s [%s:%s:%d]", err, runtime.FuncForPC(pc).Name(), fn, line)
	} else {
		log.Printf("[ERROR] %s [%s:%d]", err, fn, line)
	}
}
```

## Example

```bash
2019/05/30 11:31:30 [FATAL] pq: unsupported sslmode "ddisable"; only "require" (default), "verify-full", "verify-ca", and "disable" supported [github.com/christianhellsten/goscheduler/poller.go:52]
```
