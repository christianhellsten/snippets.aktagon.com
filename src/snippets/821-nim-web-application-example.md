---
id: '821'
title: Nim web application example
languages:
- bash
- nim
tags:
---
```bash
brew install nimlang
nimble install jester
vim hello.nim
nim compile --run hello.nim
```

```nim
import jester, asyncdispatch, strutils, asyncnet, htmlgen, logging
#
# * CLI *
#
# brew install nimlang
# nimble install jester
# vim hello.nim
# nim compile --run hello.nim
#
# * DOCS *
#
# https://nim-lang.org/docs/htmlgen.html
# https://learnxinyminutes.com/docs/nim/
#
var L = newConsoleLogger()
addHandler(L)

settings:
  port = Port(3000)
  appName = "/"
  bindAddr = "127.0.0.1"

proc layout(content: string): string =
  htmlgen.html(htmlgen.body(content))

routes:
  get "/":
    logging.debug("render form $1 $2" % [$status, $headers])
    var content = `div`(
        h1(a(href="http://nim-lang.org", title="Hello", "Hello Nim")),
        """
        <form name="input" action="$1" method="post">
          <input type="text" name="first_name" value="" placeholder="First name" />
          <input type="text" name="last_name" value="" placeholder="Last name" />
          <input type="submit" value="Submit" />
        </form>
        """ % [uri("/", absolute = false)]
        )
    body.add(layout(content))
    status = Http200

  post "/":
    logging.debug("process form $1 $2" % [$status, $headers])
    # TODO: How can we sanitize submitted form data?
    var content = `div`(
        h1(
          a(href="http://nim-lang.org", title="Hello", "Hello $1 $2" % [$request.params["first_name"], $request.params["last_name"]])
        ),
        h4("Form data"),
        p($request.params),
    )
    body.add(layout(content))
    status = Http200

runForever()
```
