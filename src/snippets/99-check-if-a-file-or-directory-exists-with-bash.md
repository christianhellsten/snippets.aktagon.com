---
id: '99'
title: Check if a file or directory exists with bash
languages:
- bash
tags:
---
This script tests if nginx exists and is executable. The script prints a warning and exits, if nginx doesn't exists or isn't executable:


```bash
DAEMON=/usr/local/sbin/nbinx
if [ ! -x $DAEMON ]
then
   echo "Couldn't find $DAEMON. Please set path to DAEMON."
   exit 0
fi
```
    

See **man test** for more information on how to use the test command.

