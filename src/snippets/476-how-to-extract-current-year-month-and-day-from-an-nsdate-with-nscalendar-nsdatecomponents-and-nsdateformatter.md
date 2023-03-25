---
id: '476'
title: How to extract current year, month, and day from an NSDate with NSCalendar,
  NSDateComponents, and NSDateFormatter
languages:
- objectivec
tags:
---
You have three options to achieve what the title says:

Using NSDate and NSCalendar to extract current year, month, and day
-------------------------------------------------------------------


```objectivec
NSDate *now = [NSDate date];
// Specify which units we would like to use
unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
NSDateComponents *components = [calendar components:units fromDate:now];

NSInteger year = [components year];
NSInteger month = [components month];
NSInteger day = [components day];
```
    

Using NSDate descriptionWithCalendarFormat to extract current year, month, and day
----------------------------------------------------------------------------------


```objectivec
NSString *year = [now descriptionWithCalendarFormat:@"%Y" timeZone:nil locale:nil];
NSString *month = [now descriptionWithCalendarFormat:@"%m" timeZone:nil locale:nil];
NSString *day = [now descriptionWithCalendarFormat:@"%d" timeZone:nil locale:nil];
```
    

The code will compile but spit out the following warning, because it's not supported on the iPhone:


```objectivec
warning: 'NSDate' may not respond to '-descriptionWithCalendarFormat:timeZone:locale:
```
    

Using NSDateFormatter to extract current year, month, and day
-------------------------------------------------------------


```objectivec
NSDate *now = [NSDate date];
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyy"];
NSString *year = [formatter stringFromDate:now];
[formatter setDateFormat:@"MM"];
NSString *month = [formatter stringFromDate:now];
[formatter setDateFormat:@"dd"];
NSString *day = [formatter stringFromDate:now];
```
    

