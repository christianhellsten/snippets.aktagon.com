---
id: '784'
title: How to send emails with Mailgun and Elixir
languages:
- elixir
tags:
---
This example shows how to send emails with Mailgun and Elixir:

```elixir
url = "https://api.mailgun.net/v3/xxx.mailgun.org/messages"
headers = [
  "User-Agent": "My App",
  "Content-Type": "application/x-www-form-urlencoded"
]
params = %{
  "from" => "christian@xxx.mailgun.org",
  "to" => "christian@aktagon.com",
  "subject" => "Hello Christian",
  "text" => "Hello"
}
body = URI.encode_query(params)
auth = { "api", "key-xxx" }
response = HTTPotion.post url, [body: body, headers: headers, basic_auth: auth]
if !HTTPotion.Response.success?(response) do
  throw(response.body)
end
Poison.decode!(response.body)
```

Replace the API key and mailgun URL with your own API key and URL.

## Dependencies

* [HTTPotion - HTTP client](https://github.com/myfreeweb/httpotion)
* [Poison - JSON](https://github.com/devinus/poison)
