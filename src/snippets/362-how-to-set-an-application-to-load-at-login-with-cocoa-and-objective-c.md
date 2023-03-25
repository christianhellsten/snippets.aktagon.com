---
id: '362'
title: How to set an application to load at login with Cocoa and Objective-C
languages:
- objectivec
tags:
---
In XCode add the following to your controller's header file:


```objectivec
@interface AppController : NSObject {
IBOutlet NSButton *buttonOpenAtLogin;
}
.
.
.
- (IBAction)addLoginItem:(id)sender;
- (void)enableLoginItemWithLoginItemsReference:(LSSharedFileListRef )theLoginItemsRefs ForPath:(CFURLRef)thePath;
- (void)disableLoginItemWithLoginItemsReference:(LSSharedFileListRef )theLoginItemsRefs ForPath:(CFURLRef)thePath;
```
    

Add the following to the implementation:


```objectivec
@implementation AppController

- (void)enableLoginItemWithLoginItemsReference:(LSSharedFileListRef )theLoginItemsRefs ForPath:(CFURLRef)thePath {
	// We call LSSharedFileListInsertItemURL to insert the item at the bottom of Login Items list.
	LSSharedFileListItemRef item = LSSharedFileListInsertItemURL(theLoginItemsRefs, kLSSharedFileListItemLast, NULL, NULL, thePath, NULL, NULL);		
	if (item)
		CFRelease(item);
}

- (void)disableLoginItemWithLoginItemsReference:(LSSharedFileListRef )theLoginItemsRefs ForPath:(CFURLRef)thePath {
	UInt32 seedValue;
	
	// We're going to grab the contents of the shared file list (LSSharedFileListItemRef objects)
	// and pop it in an array so we can iterate through it to find our item.
	NSArray  *loginItemsArray = (NSArray *)LSSharedFileListCopySnapshot(theLoginItemsRefs, &seedValue);
	for (id item in loginItemsArray) {		
		LSSharedFileListItemRef itemRef = (LSSharedFileListItemRef)item;
		if (LSSharedFileListItemResolve(itemRef, 0, (CFURLRef*) &thePath, NULL) == noErr) {
			if ([[(NSURL *)thePath path] hasPrefix:SGApplicationPath])
				LSSharedFileListItemRemove(theLoginItemsRefs, itemRef); // Deleting the item
		}
	}
	
	[loginItemsArray release];
}

- (IBAction)addLoginItem:(id)sender {
	CFURLRef url = (CFURLRef)[NSURL fileURLWithPath:SGApplicationPath];
	
	// Create a reference to the shared file list.
	LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
	
	if (loginItems) {
		if ([[buttonOpenAtLogin selectedCell] state] == YES)
			[self enableLoginItemWithLoginItemsReference:loginItems ForPath:url];
		else
			[self disableLoginItemWithLoginItemsReference:loginItems ForPath:url];
	}
	CFRelease(loginItems);
}
.
.
.
```
    

In Interface Builder do the following:

-   Add a User Defaults Controller Bindings object to IB.
-   Add a checkbox button or menu item to IB
-   Bind the button to the IBOutlet in the controller
-   Select the button and bind it to the User Defaults Controller (Cmd+5). Enter values in "Controller Key" and "Model Key Path"

Code found [here](http://bitbucket.org/secondgear/shared-file-list-example/)

See <http://developer.apple.com/cocoa/cocoabindings.html> for more details...

