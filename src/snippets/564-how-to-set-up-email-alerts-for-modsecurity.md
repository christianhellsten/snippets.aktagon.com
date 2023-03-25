---
id: '564'
title: How to set up email alerts for ModSecurity
languages:
- lua
tags:
---
Sending email alerts/notifications from ModSecurity is easy with Lua. Just put this script somewhere:


```lua
from = "hell@hell.com"
to = "heaven@heaven.com"

-- We use the mail command to send emails. You could also use the lua socket library:
-- http://w3.impa.br/~diego/software/luasocket/smtp.html
function main()
  -- create email
  local subject = m.getvar("TX.email_subject")
  local body = m.getvar("TX.email_body")

  if subject == nil then
    return nil
  end

  if body == nil then
    body = subject .. ":\n" ..
     "IP:\t " .. m.getvar("REMOTE_ADDR") .. "\n " ..
     "HOST:\t " .. m.getvar("REMOTE_HOST") .. "\n " ..
     "URI:\t " .. m.getvar("REQUEST_URI")
  end

  m.log(4, "Sending email " .. subject)
  m.log(5, body)

  -- use the mail command to send emails
  local cmd = "echo -e \"" .. body .. "\" | mail -s \"" .. subject .. "\" ".. from .." -- -r \"" .. to .. "\""

  -- remove variables
  m.setvar('tx.email_subject', nil)
  m.setvar('tx.email_body', nil)

  -- execute command
  local f = io.popen(cmd)

  -- read result
  local l = f:read("*a")
  m.log(5, "mail output: " .. l)
  f:close()
  --print(l)
  return nil
end
```
    

Next set up a rule that executes the script after a user has been blocked:


```lua
SecRule IP:bf_ip_counter "@gt 3" \
                "phase:5,pass,t:none, \
                setvar:'tx.email_subject=Blocking IP. Too many authentication failures.',exec:/xxx/email.lua, \
        ...
```
    

Now verify that it works. Note that this script uses the mail command, so [make sure sending mails with Postfix and mail](http://snippets.aktagon.com/snippets/562-How-to-send-emails-from-the-command-line-in-Linux) works.

