---
id: '809'
title: 'cannot convert value (type interface {}) to type xml.CharData: need type assertion'
languages:
- go
tags:
---
```go
var value interface{}
...
// reflect: call of reflect.Value.Interface on zero Value
if value != nil {
  xml.CharData(fmt.Sprintf("%v", reflect.ValueOf(value).Interface()))
} else {
  xml.CharData(nil)
}
```
