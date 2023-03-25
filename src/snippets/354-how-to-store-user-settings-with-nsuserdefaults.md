---
id: '354'
title: How to store user settings with NSUserDefaults
languages:
- objectivec
tags:
---
Storing preferences
-------------------


```objectivec
NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
[preferences setObject:@"SOME_DATA" forKey:@"KEY"];
```
    

Retrieving preferences
----------------------


```objectivec
[preferences stringForKey:@"KEY"];
[preferences integerForKey:@"KEY"];
[preferences booleanForKey:@"KEY"];
```
    

Listing preferences with the defaults command
---------------------------------------------

To list all preferences for a specific app, use this command:


```objectivec
$ defaults read com.aktagon.XXXApp
```
    

References
----------

<http://developer.apple.com/documentation/Cocoa/Conceptual/UserDefaults/UserDefaults.html>

