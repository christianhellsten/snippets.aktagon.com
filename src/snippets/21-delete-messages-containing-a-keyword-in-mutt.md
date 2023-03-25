---
id: '21'
title: Delete messages containing a keyword in mutt
languages:
- bash
tags:
- sendmail
---
Bulk operations in mutt, a console based email client, are easy. Here's how to delete messages containing the keyword 'Newsletter'.


```bash
T
Newsletter
;
d
$
```
    

T - asks which messages you want to tag and you reply with 'Newsletter'.

; - asks which action you want to run on the tagged messages.

d - tells that the action you want is delete.

$ - synchronizes the view with the underlying persistence layer.

