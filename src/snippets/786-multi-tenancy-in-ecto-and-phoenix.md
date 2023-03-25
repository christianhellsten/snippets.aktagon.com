---
id: '786'
title: Multi-tenancy in Ecto and Phoenix
languages:
- bash
- elixir
tags:
---
## Creating a new tentant

A new tenant requires a namespace, which is a schema in Postgres, and a prefix in Ecto:

```bash
$ psql -U postgres database_x
> create schema aktagon; 
```

## Querying data

```elixir
import Ecto.Query
email = "christian@aktagon.com"
q = from(m in User, where: m.email == ^email)
Repo.all(%{q | prefix: "aktagon"})
```

Documentation: https://hexdocs.pm/ecto/Ecto.Query.html#module-query-prefix

## Inserting data

```elixir
Repo.insert(
  Ecto.put_meta(
   %User{ email: "christian@aktagon.com" },
   prefix: "aktagon"
  )
)
```

## Migrations

```bash
$ mix ecto.migrate --prefix "aktagon"
```

## Notes

- (KeyError) key :\_\_meta\_\_ not found

I got this error when passing a changeset to Ecto.put_meta instead of a User struct.
