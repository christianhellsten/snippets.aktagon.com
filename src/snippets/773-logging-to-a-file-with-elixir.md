---
id: '773'
title: Logging to a file with Elixir
languages:
- elixir
tags:
---
mix.exs:
```elixir
  def application do
    [
      applications: [:logger, :logger_file_backend, ...],
      mod: {Snippets, []}
    ]
  end

  def deps do
    [
      {:cowboy, "~> 1.0.0"}, # web server
      {:logger_file_backend, "~> 0.0.7"} # writes log messages to a file, LOL
      ....
    ]
   end
```

config/dev.exs:   

```elixir   
config :logger, :error_log,
  path: "log/app.log",
  level: :debug
```
