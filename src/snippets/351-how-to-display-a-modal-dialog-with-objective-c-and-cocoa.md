---
id: '351'
title: How to display a modal dialog with Objective-C and Cocoa
languages:
- objectivec
tags:
- column
- postgresql
---

```objectivec
int choice = NSRunAlertPanel(@"title", @"description", @"DEFAULT", @"ALTERNATE", "OTHER", 8);
	
if(choice == NSAlertDefaultReturn)        

} else if(choice == NSAlertOtherReturn) {

} else if(choice == NSAlertAlternateReturn) {

}
```
    

