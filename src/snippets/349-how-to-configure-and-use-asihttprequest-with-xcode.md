---
id: '349'
title: How to configure and use ASIHttpRequest with XCode
languages:
- objectivec
tags:
---
Get ASIHttpRequest from GitHub
------------------------------


```objectivec
$ cd project-dir
```
    


```objectivec
$ git clone git://github.com/pokeb/asi-http-request.git
```
    


```objectivec
mkdir -p lib/ASIHttpRequest
mv asi-http-request/Classes/* lib/ASIHttpRequest
```
    

Link required frameworks
------------------------

In Groups & Files in XCode, right-click Frameworks &gt; Linked Frameworks choose Add Existing Frameworks.

Select CoreServices.framework. Do the same for SystemConfiguration.framework.

Next add libz.1.2.3.dylib by selecting Add Existing Files from the same menu. The full path to this file is
/Developer/SDKs/MacOSX10.5.sdk/usr/lib/libz.1.2.3.dylib

Making asynchronous requests
----------------------------


```objectivec
- (void)requestDone:(ASIHTTPRequest *)request
{
	NSString *response = [request responseString];
	NSLog ( @"Response %@", response );

}

- (void)requestWentWrong:(ASIHTTPRequest *)request
{
	NSError *error = [request error];
	NSLog ( @"Something wrong" );
}

- (void)requestURL()
{
	NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
	ASIHTTPRequest *request = [[[ASIHTTPRequest alloc] initWithURL:url] autorelease];
	
	[request setDelegate:self];
	[request setDidFinishSelector:@selector(requestDone:)];
	[request setDidFailSelector:@selector(requestWentWrong:)];
	
        [networkQueue addOperation:request];
	[networkQueue go];
}
```
    

Making synchronous requests
---------------------------


```objectivec
NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
	ASIHTTPRequest *request = [[[ASIHTTPRequest alloc] initWithURL:url] autorelease];
	[request start];
	NSError *error = [request error];
	
	if (!error) {
		NSString *response = [request responseString];
		NSLog ( @"Response: %@", response );
	} else {
		NSLog ( @"Something went wrong" );
	}
```
    

