---
id: '816'
title: 'accounts.ex:333: value `"b4801820-a811-43e8-b3b1-183bd3922ab7"` in `where`
  cannot be cast to type :id in query:'
languages:
- elixir
tags:
---
To fix "cannot be cast to type :id in query" when using UUID primary keys, add "foreign_key_type" to all models:
```elixir
defmodule Email.Accounts.List do
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type Ecto.UUID
end
```
