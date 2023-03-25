---
id: '867'
title: How to set the session's time zone to UTC when using Golang's database/sql
languages:
- go
tags:
---
Always remember to set the time zone session setting when using database/sql and timestamps, otherwise timestamps will use the database default:

```go
db, err = sql.Open("postgres", "timezone=UTC")
if err != nil {
    log.Fatal(err)
}
defer db.Close()
var timezone string
err = db.QueryRow("SHOW timezone").Scan(&timezone)
if err != nil {
    log.Fatal(err)
}
log.Println("timezone:", timezone)
```

Running **SET TIME ZONE 'Africa/Casablanca';** once in a connection won't work because a pool of connections is used.
