---
id: '808'
title: Simple content negotation in Golang
languages:
- go
tags:
---
```go
func DoSomething(r *http.Request) string {
	accept := r.Header.Get("Accept")
	switch accept {
	case "application/json":
		return renderJSON()
	case "application/xml":
		return renderXML()
	}
	return renderHTML()
}
```
