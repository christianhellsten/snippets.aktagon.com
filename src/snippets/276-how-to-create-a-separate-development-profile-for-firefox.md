---
id: '276'
title: How to create a separate development profile for Firefox
languages:
- bash
tags:
---
Extensions slow down Firefox so I prefer disabling all but the most important Firefox extensions when coding.

Here's how to do it:

1.  First, create a development profile following these instructions <http://support.mozilla.com/en-US/kb/Managing+profiles>

<!-- -->

1.  Next, create a shortcut that starts Firefox in development mode:


```bash
# Mac OSX
/Applications/Firefox.app/Contents/MacOS/firefox-bin -P development -no-remote

# Linux
/usr/lib/firefox/firefox-bin -P development -no-remote

# Windblows
"C:\Program Files\Mozilla Firefox\firefox.exe" -P development -no-remote
```
    

