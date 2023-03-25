---
id: '790'
title: How to make Phoenix listen to a specific IP address
languages:
- elixir
tags:
---
In config/{dev,prod}.exs:
```elixir
config :the_app, TheApp.Endpoint,
  http: [ip: {127,0,0,1}, port: 1234],
```

IP address must be in tuple format {127,0,0,1}.
