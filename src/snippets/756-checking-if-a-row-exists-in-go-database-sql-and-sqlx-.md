---
id: '756'
title: Checking if a row exists in Go (database/sql and SQLX)
languages:
- go
tags:
---
Code:


```go
func rowExists(query string, args ...interface{}) bool {
  	var exists bool
  	query = fmt.Sprintf("SELECT exists (%s)", query)
  	err := db.QueryRow(query, args...).Scan(&exists)
  	if err != nil && err != sql.ErrNoRows {
    		glog.Fatalf("error checking if row exists '%s' %v", args, err)
  	}
  	return exists
}
```
    

Usage:


```go
if rowExists("SELECT id FROM feed_items WHERE url=$1", item.Link) {
	return
}
```
