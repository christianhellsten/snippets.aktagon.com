---
id: '776'
title: Pagination with Phoenix and Ecto
languages:
- elixir
tags:
---
Tested with Ecto 2.2 and Phoenix 1.3.

This module allows you to perform pagination with Phoenix and Ecto:

```elixir
defmodule Pagination do
  import Ecto.Query
  alias Snippets.Repo
  #
  # ## Example
  #
  #    Snippets.Snippet
  #    |> order_by(desc: :inserted_at)
  #    |> Pagination.page(0, per_page: 10)
  #
  def page(query, page, per_page: per_page) when is_nil(page) do
    page(query, 0, per_page: per_page)
  end

  def page(query, page, per_page: per_page) when is_binary(page) do
    page = String.to_integer(page)
    page(query, page, per_page: per_page)
  end

  def page(query, page, per_page: per_page) do
    count = per_page + 1
    result = query
             |> limit(^count)
             |> offset(^(page*per_page))
             |> Repo.all
    has_next = (length(result) == count)
    has_prev = page > 0
    total_count = Repo.one(from t in subquery(query), select: count("*"))
    page = %{
      has_next: has_next,
      has_prev: has_prev,
      prev_page: page - 1,
      next_page: page + 1,
      page: page,
      first: page*per_page+1,
      last: Enum.min([page+1*per_page, total_count]),
      count: total_count,
      list: Enum.slice(result, 0, count-1)
    }
  end
end
```

Usage:
```elixir
Snippets.Snippet
|> order_by(desc: :inserted_at)
|> Pagination.page(0, per_page: 10)
```

## View helper

```elixir
defmodule PaginationHelpers do
  import Phoenix.HTML
  import Phoenix.HTML.Form
  import Phoenix.HTML.Link
  import Phoenix.HTML.Tag

  def pagination_text(list) do
    ~e"""
    Displaying <%= list.first %>-<%= list.last %> of <%= list.count %>
    """
  end

  def pagination_links(conn, list, route) do
    content_tag :div, class: "pagination" do
      children = []
      if list.has_prev do
        children = children ++ link "Previous", to: route.(conn, :index, page: list.prev_page), class: "btn btn-secondary col-md-1"
      end
      if list.has_next do
        children = children ++ link "Next", to: route.(conn, :index, page: list.next_page), class: "btn btn-secondary col-md-1"
      end
      children
    end
  end
end
```

Usage:

```elixir
<%= pagination_text(@snippets) %>
<%= pagination_links(@conn, @snippets, &snippet_path/3) %>
```
