---
id: '819'
title: Pattern matching order in Elixir
languages:
- elixir
tags:
---
```elixir
defmodule Greeter do
  def hello(name) do
    "Hello #{name}"
  end
  def hello(:jane), do: "Hello Jane!!!!!"
end

Greeter.hello(:jane) # Prints "Hello Jane"
Greeter.hello(:janet) # Prints "Hello Janet"

defmodule Greeter do
  def hello(:jane), do: "Hello Jane!!!!!"
  def hello(name) do
    "Hello #{name}"
  end
end

Greeter.hello(:jane) # Prints "Hello Jane!!!!!"
Greeter.hello(:janet) # Prints "Hello Janet"
```
