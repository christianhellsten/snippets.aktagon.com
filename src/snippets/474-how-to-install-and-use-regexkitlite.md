---
id: '474'
title: How to install and use RegexKitLite
languages:
- objectivec
tags:
- escape
- postgres
- sql
---
Install RegexKitLite
--------------------

First download [RegexKitLite](http://regexkit.sourceforge.net/).

Configure your project
----------------------

Double-click the project target under Targets in the Groups & Files sidebar.

Under the Linking header add -licucore to the Other Linker Flags setting.

Setup documentation
-------------------

In the Xcode menu, open Xcode-&gt;Preferences-&gt;Documentation. Then click the Add Publisher button.

Add this URL:
feed://regexkit.sourceforge.net/RegexKitLiteDocSets.atom

Using RegexKitLite
------------------

This will extract the integer that is embedded in a td tag:


```objectivec
NSString *regex = @"<td id\"amount\">(\\d+)</td>";
NSString *body = [[[NSString alloc] initWithData:html encoding: NSASCIIStringEncoding] autorelease];
NSString *amount = [body stringByMatching:regex capture:1];

if ([amount isEqual:@""] == NO) {
	NSLog(@"Amount is %@", amount);
} else {
	NSLog(@"Amount was not found.");
}
```
    

