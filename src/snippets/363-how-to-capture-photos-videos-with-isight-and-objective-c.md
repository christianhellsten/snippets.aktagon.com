---
id: '363'
title: How to capture photos/videos with iSight and Objective-C
languages:
- objectivec
tags:
---
There are plenty of resources online that explain how to access iSight:

-   [How to access iSight](http://ebbinghaushq.blogspot.com/2006/10/how-to-access-isight.html)

This article explains how to use QuartzComposer for capturing images with iSight. The benefit of using QuartzComposer is that you don't have to write a lot of code to capture an image. All you have to do is setup a QCView with IB and bind it to an outlet, then to get the snapshot you call this method:


```objectivec
NSImage *screenshot = [isightView snapshotImage];
```
    

Alternatively, you could also use:


```objectivec
- (id) createSnapshotImageOfType:(NSString*)type
```
    

The code in the article didn't work for me:


```objectivec
NSImage *currentImage = [qcView valueForOutputKey:@"ImageOutput"];
```
    

The article also forgot to mention that you have to import and link to the following frameworks:


```objectivec
#import <QuartzCore/QuartzCore.h>
#import <Quartz/Quartz.h>
```
    

-   [CocoaSequenceGrabber](http://www.skyfell.org/cocoasequencegrabber.html)

Haven't tried this one yet.

-   [Integrating iSight into your cocoa application…](http://iloveco.de/adding-isight/)

This example is not complete.

-   [QTCaptureView](http://developer.apple.com/DOCUMENTATION/quicktime/Reference/QTCaptureView_Class/Reference/Reference.html)

Have a look at one of the demos like [StillMotion](http://developer.apple.com/samplecode/StillMotion/index.html)

