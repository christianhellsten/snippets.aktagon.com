---
id: '358'
title: How to make a clickable link inside a NSTextField and Cocoa
languages:
- objectivec
tags:
---
From [How do I embed a hyperlink inside an NSTextField or NSTextView?](http://developer.apple.com/qa/qa2006/qa1487.html)

NSAttributedString+Hyperlink.h


```objectivec
#import <Cocoa/Cocoa.h>

@interface NSAttributedString (Hyperlink)
+(id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)aURL;
@end
```
    

NSAttributedString+Hyperlink.m:


```objectivec
#import "NSAttributedString+Hyperlink.h"


@implementation NSAttributedString (Hyperlink)
+(id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)aURL
{
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString: inString];
    NSRange range = NSMakeRange(0, [attrString length]);
	
    [attrString beginEditing];
    [attrString addAttribute:NSLinkAttributeName value:[aURL absoluteString] range:range];
	
    // make the text appear in blue
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
	
    // next make the text appear with an underline
    [attrString addAttribute:
	 NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSSingleUnderlineStyle] range:range];
	
    [attrString endEditing];
	
    return [attrString autorelease];
}
@end
```
    

This code sets the contents of the NSTextField to a URL:


```objectivec
#import "NSAttributedString+Hyperlink.h"

[textURL setAllowsEditingTextAttributes: YES];
[textURL setSelectable: YES];
	
NSURL* url = [NSURL URLWithString:@"http://www.apple.com"];
	
NSMutableAttributedString* string = [[NSMutableAttributedString alloc] init];
[string appendAttributedString: [NSAttributedString hyperlinkFromString:@"Apple Computer" withURL:url]];
	
[textURL setAttributedStringValue: string];
```
    

