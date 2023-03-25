---
id: '759'
title: Migrations for Golang
languages:
- go
tags:
- finland
- finnish
- hetu
- ruby
- ssid
---
## Alternative 1: Code your own

```go
package main

import (
	"database/sql"
	"fmt"
	_ "github.com/lib/pq" // Postgres
	"io/ioutil"
	"os"
	"regexp"
	"sort"
	"strconv"
	"strings"
)

type Migration struct {
	Name    string
	File    string
	Version int
}

type Migrations []Migration

func (slice Migrations) Len() int {
	return len(slice)
}

func (slice Migrations) Less(i, j int) bool {
	return slice[i].Version < slice[j].Version
}

func (slice Migrations) Swap(i, j int) {
	slice[i], slice[j] = slice[j], slice[i]
}

func migrate() {
	tx, err := db.Begin()
	dirname := "db/migrate/"
	// Find migration files
	d, err := os.Open(dirname)
	check(err)
	defer d.Close()
	fi, err := d.Readdir(-1)
	check(err)
	migrations := Migrations{}
	for _, file := range fi {
		if file.Mode().IsRegular() && strings.HasSuffix(file.Name(), ".sql") {
			// Find version number from file name 01_name.sql
			re := regexp.MustCompile("^[0-9]+")
			version, err := strconv.Atoi(re.FindString(file.Name()))
			if err != nil {
				panic("not a valid migration filename: " + file.Name())
			}
			migrations = append(migrations, Migration{Name: file.Name(), Version: version, File: file.Name()})
		}
	}
	// Process all migrations
	sort.Sort(migrations)
	for _, migration := range migrations {
		// Check if migration has been run
		var exists bool
		err = tx.QueryRow("select exists (select 1 from versions where id = $1)", migration.Version).Scan(&exists)
		if err != nil && err != sql.ErrNoRows {
			check(err)
		}
		// Run migration
		if exists == false {
			bytes, err := ioutil.ReadFile(dirname + migration.File)
			check(err)
			sql := string(bytes)
			// Split migration file at ; because some drivers can't handle multiple
			// statements This is not fool proof, but should work for most
			// migrations.
			count := strings.Count(sql, ";")
			statements := strings.SplitN(string(sql), ";", count)
			fmt.Println("RUN", "-", migration.Name)
			for _, statement := range statements {
				_, err = tx.Exec(statement)
				check(err)
			}
			_, err = tx.Exec("INSERT INTO versions VALUES ($1)", migration.Version)
			check(err)
		} else {
			fmt.Println("OK ", "-", migration.Name)
		}
	}
	check(tx.Commit())
}
```

## Alternative 2: sql/migrate

```go
package main

import (
	"github.com/rubenv/sql-migrate"
	"gitlab.com/christianhellsten/a15/domains"
	"log"
	"os"
)

func main() {
	migrations := &migrate.FileMigrationSource{
		Dir: "db/migrations",
	}
	var dir migrate.MigrationDirection
	switch os.Args[1] {
	case "up":
		dir = migrate.Up
	case "down":
		dir = migrate.Down
	default:
		dir = migrate.Up
	}
	n, err := migrate.Exec(domains.DBI, "postgres", migrations, dir)
	if err != nil {
		log.Fatalln(err)
	}
	log.Printf("Applied %d migrations %s!\n", n, os.Args[1])
}
```

## Alternative 3: Sqitch

http://sqitch.org/
