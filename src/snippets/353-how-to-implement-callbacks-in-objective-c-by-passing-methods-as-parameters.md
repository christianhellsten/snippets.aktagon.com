---
id: '353'
title: How to implement callbacks in Objective-C by passing methods as parameters
languages:
- objectivec
tags:
---
Example of a method that takes a callback method, defined as theSelector, as a parameter:


```objectivec
- (void) getURL:(NSString *)theURL theSelector:(SEL)theSelector
{
	NSURL *url = [NSURL URLWithString:theURL];
		
	ASIHTTPRequest *request = [[[ASIHTTPRequest alloc] initWithURL:url] autorelease];
	
	[request setDelegate:self];
	[request setDidFinishSelector:theSelector];
	[request setDidFailSelector:@selector(onError:)];
	
       [networkQueue addOperation:request];
	[networkQueue go];
}
```
    


```objectivec
// Don't forget the semicolon
SEL sel = @selector(onResponseReceived:);
[self getURL:@"http://www.google.com" selector:sel];
```
    


```objectivec
- (void)onResponseReceived:(ASIHTTPRequest *)request {
}
```
    

