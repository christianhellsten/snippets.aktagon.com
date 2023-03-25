---
id: '788'
title: Go and Postgres Example
languages:
- bash
- go
tags:
---
```go
package main

import (
	"database/sql"
	_ "github.com/lib/pq"
	"log"
	"time"
)

func pollChanges() {
	var id int
	var name string
	rows, err := db.Query("SELECT id, name FROM people")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next() {
		err := rows.Scan(&id, &name)
		if err != nil {
			log.Fatal(err)
		}
		log.Println(id, name)
	}
	err = rows.Err()
	if err != nil {
		log.Fatal(err)
	}
}

var db *sql.DB

func main() {
	var err error
	db, err = sql.Open("postgres", "")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	for {
		time.Sleep(1000 * time.Millisecond)
		log.Println("Polling for changes...")
		pollChanges()
	}
}
```

Run:
```bash
PGUSER= PGPASSWORD= PGDATABASE=db_xyz PGSSLMODE=disable ./go-app
```

## Notes

- For a list of available connection parameters and environment variables, see:
https://www.postgresql.org/docs/9.0/static/libpq-envars.html

- Bind variables are named $1, $2, etc, not ?.

Using question marks instead of, e.g., $1 will result in the following error:
```
syntax error at or near ","
```

- Scan requires a pointer. Forgetting to add an ampersand (Scan(id) vs Scan(&id)) will result in the following error:

```
Scan error on column index 0: destination not a pointer
```
