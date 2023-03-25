---
id: '749'
title: Sanitizing XML with Go's UnmarshalXML
languages:
- go
tags:
- pg_trgm
- pgtrgm
- postgres
- search
- substring
- trigram
- unaccent
---
Use a custom type to avoid this error when unmarshalling XML with Go:


```go
strconv.ParseInt: parsing "86148865.00": invalid syntax
```
    

Example:


```go
import (
    "encoding/xml"
    "strconv"
)

type DogHouse struct {
    //Count int xml:"dog_house>count" << this code will fail with "invalid syntax"
    Count sanitizedInt xml:"dog_house>count"
}

type sanitizedInt int

func (si *sanitizedInt) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error {
    var value string
    // Read tag content into value
    d.DecodeElement(&value, &start)
    // Remove "crap" and convert to int64
    i, err := strconv.ParseInt(strings.Replace(value, "crap", "", -1), 0, 64)
    if err != nil {
        return err
    }
    // Cast int64 to sanitizedInt
    *si = (sanitizedInt)(i)
    return nil
}
```
    

