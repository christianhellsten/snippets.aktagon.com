---
id: '785'
title: How to fix "the response was already sent" error in Elixir
languages:
- elixir
tags:
---
If you get an "(Plug.Conn.AlreadySentError) the response was already sent" error:

```elixir
Server: localhost:4000 (http)
Request: POST /api/v1/xxx
** (exit) an exception was raised:
    ** (Plug.Conn.AlreadySentError) the response was already sent
        (plug) lib/plug/conn.ex:332: Plug.Conn.put_status/2
```

Verify that you have not defined the action plug more than once:
```
plug :action
```
