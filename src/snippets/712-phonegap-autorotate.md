---
id: '712'
title: Phonegap Autorotate
languages:
- objectivec
tags:
- collapsible
- details
- no-javascript
- open
---
In MainViewController\#shouldAutorotateToInterfaceOrientation return YES:


```objectivec
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES; //[super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}
```
    

