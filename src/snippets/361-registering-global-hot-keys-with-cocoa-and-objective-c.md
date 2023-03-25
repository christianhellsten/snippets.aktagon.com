---
id: '361'
title: Registering global hot keys with Cocoa and Objective-C
languages:
- objectivec
tags:
---
In your application's controller add the following:


```objectivec
- (void)awakeFromNib
{
	[self registerHotKeys];
}
```
    

And the following code which registers the hot keys:


```objectivec
-(void)registerHotKeys
{	
    EventHotKeyRef gMyHotKeyRef;
    EventHotKeyID gMyHotKeyID;
    EventTypeSpec eventType;
    eventType.eventClass=kEventClassKeyboard;
    eventType.eventKind=kEventHotKeyPressed;	
	
    InstallApplicationEventHandler(&OnHotKeyEvent, 1, &eventType, (void *)self, NULL);
	
    gMyHotKeyID.signature='htk1';
    gMyHotKeyID.id=1;
    RegisterEventHotKey(20, cmdKey+optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);	
	
    gMyHotKeyID.signature='htk2';
    gMyHotKeyID.id=2;	
    RegisterEventHotKey(21, cmdKey+optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);	
	
    gMyHotKeyID.signature='htk3';
    gMyHotKeyID.id=3;	
    RegisterEventHotKey(23, cmdKey+optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);	
}

OSStatus OnHotKeyEvent(EventHandlerCallRef nextHandler,EventRef theEvent,void *userData)
{
    EventHotKeyID hkCom;
	
    GetEventParameter(theEvent, kEventParamDirectObject, typeEventHotKeyID, NULL, sizeof(hkCom), NULL, &hkCom);
    AppController *controller = (AppController *)userData;	
	
    int l = hkCom.id;
	
    switch (l) {
        case 1: 		
			NSLog(@"Capture area");	
			[ScreenCapture captureArea:controller];
			break;
        case 2: 
			NSLog(@"Capture screen");	
			[ScreenCapture captureScreen:controller];
			break;
        case 3: 
			NSLog(@"Capture window");	
			[ScreenCapture captureWindow:controller];
			break;  
    }

    return noErr;
}
```
    

The code used in this snippet was inspired by this blog post <http://dbachrach.com/blog/2005/11/28/program-global-hotkeys-in-cocoa-easily/>

Alternatives
------------

If you need a more complete solution you can use one of these open-source alternatives:

-   [NDHotKeyEvent](http://homepage.mac.com/nathan_day/pages/source.xml#ndhotkeyevent)
-   [HotKeysLib3](http://rogueamoeba.com/sources/)

Showing the application window
------------------------------

Usually you want to show the application window when the hot key is pressed. This can be done as explained in this [snippet](http://snippets.aktagon.com/snippets/357-Showing-and-hiding-an-NSWindow-programatically)

