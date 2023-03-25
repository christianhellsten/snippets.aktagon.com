---
id: '797'
title: Hello Postgres and REST in Crystal
languages:
- bash
- crystal
- yaml
tags:
---
NOTE: This does not work with Crystal 0.25.2.

## Install Crystal

```bash
brew install crystal-lang
mkdir projects/hello
shards init
```

## Set up dependencies

```yaml
dependencies:
  pg:
    github: will/crystal-pg
    version: "~> 0.5"
  kemal:
    github: sdogruyol/kemal
    version: "~> 0.16.1"
```

```bash
shards
```

## Write a simple REST API

```crystal
require "kemal"
require "json"
require "pg"

PG_URL = "postgres://postgres@localhost:5432/xxx"
DB     = PG.connect PG_URL

get "/" do |env|
  env.response.content_type = "application/json"
  users = DB.exec("SELECT * FROM users")
  users.to_hash.map do |user|
    {first_name: user["first_name"].as(String), last_name: user["last_name"].as(String)}
  end.to_json
end

Kemal.run(4567)
```
