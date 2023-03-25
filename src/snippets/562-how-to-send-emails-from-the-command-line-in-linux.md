---
id: '562'
title: How to send emails from the command line in Linux
languages:
tags:
---
Use the mail command...

Specify the sender with the -r switch
-------------------------------------


```
mail -s "Yer subject" devil@devil.com -- -r "devil@devil.com"
```
    

Use echo to send your emails
----------------------------


```
echo -e "TEST\n.\n" | mail -s "subject" devil@devil.com -- -r "devil@devil.com"
```
    

Note that we use the -e switch to preserve new lines.

Use a file as the contents of your email
----------------------------------------


```
mail -s "subject" devil@devil.com -- -r "devil@devil.com" < /tmp/email
```
    

