---
id: '373'
title: 'Fixing Phusion Passenger "Error during failsafe response: closed stream"'
languages:
- bash
tags:
---
This error most probably means that Passenger doesn't have read access to all files:


```bash
Error during failsafe response: closed stream
[Thu Aug 13 01:40:05 2009] [error] [client 88.115.162.70] Premature end of script headers: 
[ pid=12581 file=Hooks.cpp:516 time=2009-08-13 01:40:05.753 ]:
  Backend process 18230 did not return a valid HTTP response. It returned: [Status]
*** Exception NoMethodError in application (undefined method []=' for nil:NilClass) (process 18230):
```
    

To fix it run:


```bash
chown -R xxx.www-data /var/www/xxx
```
    

