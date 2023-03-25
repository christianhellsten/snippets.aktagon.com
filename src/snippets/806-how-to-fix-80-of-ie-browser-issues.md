---
id: '806'
title: How to fix 80% of IE browser issues
languages:
tags:
---
## Tell IE to use standards mode, not quirks mode

Define your doctype in your HTML:

    <!DOCTYPE> element

See:
https://msdn.microsoft.com/en-us/library/cc288325(v=vs.85).aspx

## Tell IE to not use compatibility mode

This prevents, for example, IE 11 from using IE 7 rendering mode which can happen for many reasons.

If you can't add an HTTP header, then add this to your HTML and pray that it helps:

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

IE is using a compatibility mode if you see "compatible; MSIE" in the user agent header:

	"Mozilla/4.0 (compatible; MSIE 7.0;"

See:

- http://stackoverflow.com/a/9338959
- https://msdn.microsoft.com/en-us/library/ff405803(v=vs.85).aspx
- https://blogs.msdn.microsoft.com/ieinternals/2013/09/21/internet-explorer-11s-many-user-agent-strings/


## Validate your HTML and CSS

https://validator.w3.org/

## Use an IE hack

Try "zoom" or "!important".
