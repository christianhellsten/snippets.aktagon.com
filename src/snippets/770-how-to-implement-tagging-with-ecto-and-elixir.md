---
id: '770'
title: How to implement tagging with Ecto and Elixir
languages:
- elixir
tags:
---
```elixir
defmodule Snippets.Tagging do
  import Ecto.Query
  alias Ecto.Changeset
  alias Snippets.Repo
  @doc """
  Tags a model.

  ## Model

    defmodule Snippets.Tag do
      import Ecto.Query
      use Ecto.Schema

      schema "tags" do
        field :name
        many_to_many :snippets, Snippets.Snippet, join_through: "snippet_tags"
      end
    end

    defmodule Snippets.Snippet do
      import Ecto.Query
      use Ecto.Schema
      schema "snippets" do
        ...
        field :tag_list, :string, virtual: true
      end
    end

  ## Schema

    create table(:tags) do
      add :name, :text, null: false
    end
    create index(:tags, ["lower(name)"], unique: true)

    create table(:snippet_tags) do
      add :tag_id, references(:tags)
      add :snippet_id, references(:snippets)
    end
    create index(:snippet_tags, [:tag_id, :snippet_id], unique: true)

  ## Code

    snippet
    |> Changeset.cast(conn.params, @required_params, @optional_params)
    |> Tagging.changeset(Snippets.Tag, :tags, :tag_list)
    # Supports multiple types of tags
    |> Tagging.changeset(Snippets.Language, :languages, :language_list)

  """
  def changeset(changeset, model, association, tag_list_attr) do
    # Parse tags into Enum
    tag_list = changeset.changes
                |> Map.get(tag_list_attr, "")
                |> String.split(",")
                |> Enum.map(&(String.strip(&1)))
                |> Enum.reject(fn(name) -> name == "" end)
                |> Enum.map(&(String.downcase(&1)))
                |> Enum.uniq
                |> Enum.sort
    # Find existing tags
    existing_tags = from(t in model, where: t.name in ^tag_list) |> Repo.all
    # Create or find all tags
    tags = Enum.map(tag_list, fn(name) ->
      # Initialize new tag. Equivalent to:
      # new_tag = %Snippets.Tag{name: name}
      new_tag = struct(model, name: name)
      tag = Enum.find(existing_tags, new_tag, fn(existing_tag) ->
        existing_tag.name == name
      end)
    end)
    tag_changeset = Enum.map(tags, &Ecto.Changeset.change/1)
    # Add tags to changeset
    changeset |> Changeset.put_assoc(association, tag_changeset)
  end
end
```
