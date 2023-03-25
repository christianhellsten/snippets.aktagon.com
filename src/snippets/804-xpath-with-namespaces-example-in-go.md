---
id: '804'
title: XPath with namespaces example in Go
languages:
- go
tags:
---
```go
package main

import (
	"fmt"
	"github.com/moovweb/gokogiri"
	"github.com/moovweb/gokogiri/xpath"
	"io/ioutil"
)

func main() {
	xml, _ := ioutil.ReadFile("elrc-20130531.xml")
	doc, _ := gokogiri.ParseXml(xml)
	defer doc.Free()
	xp := doc.DocXPathCtx()
	xp.RegisterNamespace("xbrli", "http://www.xbrl.org/2003/instance")
	x := xpath.Compile("//xbrli:context")
	groups, err := doc.Search(x)
	if err != nil {
		fmt.Println(err)
	}
	for i, group := range groups {
		fmt.Println(i, group.Content())
	}
}
```

```
go get
go run main.go
```

