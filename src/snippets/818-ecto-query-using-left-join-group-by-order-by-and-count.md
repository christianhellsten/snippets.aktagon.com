---
id: '818'
title: Ecto query using left join, group by, order by, and count
languages:
- elixir
tags:
---
This is an example of an Ecto query that uses a left join, group by, order by, and count to produce a count of associated records for a list:

```elixir
query = from list in List,
  left_join: subscriber in assoc(list, :subscribers),
  group_by: list.id,
  order_by: [asc: :name],
  select_merge: %{ subscriber_count: count(subscriber.id) }
query |> Repo.all
```

Remember to add a virtual attribute named *subscriber_count*:
```elixir
schema "lists" do
  ...
  field :subscriber_count, :integer, virtual: true
```

Tested with Ecto 2.2.
