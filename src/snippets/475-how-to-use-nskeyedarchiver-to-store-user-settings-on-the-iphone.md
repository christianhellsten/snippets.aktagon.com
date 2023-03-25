---
id: '475'
title: How to use NSKeyedArchiver to store user settings on the iPhone
languages:
- objectivec
tags:
---
The interface we define here is called Account:


```objectivec
#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding> {
    NSString * username;
}

@property (retain) NSString * username;

-(NSString *)description;

@end
```
    

The implementation is this:


```objectivec
#import "Account.h"

@implementation Account

@synthesize username;

// Called when unserialized
- (id) initWithCoder: (NSCoder *)coder {
    if (self = [super init]) {
        self.username = [coder decodeObjectForKey:@"username"];
    }
    return self;
}

// Called when serialized
- (void) encodeWithCoder: (NSCoder *)coder {
    [coder encodeObject: self.username forKey:@"username"];
}

-(NSString *)description {
	return [NSString stringWithFormat:@"Account { username: '%@' }", self.username];
}

- (void) dealloc {
    [username release];
    [super dealloc];
}
@end
```
    

The application delegate interface named TheAppDelegate is defined here:


```objectivec
@interface TheAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NSMutableDictionary * accounts;
    ...
}

@property (nonatomic, retain) NSMutableDictionary * accounts;


- (NSString *) pathForDataFile;
- (void) saveDataToDisk;
- (void) loadDataFromDisk;
```
    

The application delegate implementation has these methods defined:


```objectivec
// Called when application launches
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadDataFromDisk]; 
}

// Path to the data file in the app's Documents directory
- (NSString *) pathForDataFile {
    NSArray*	documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString*	path = nil;
	
    if (documentDir) {
        path = [documentDir objectAtIndex:0];    
    }
	
    return [NSString stringWithFormat:@"%@/%@", path, @"data.bin"];
}

- (void) saveDataToDisk {
    NSString * path = [self pathForDataFile];
    NSLog(@"Writing accounts to '%@' %@", path, self.accounts);
	
    NSMutableDictionary * rootObject;
    rootObject = [NSMutableDictionary dictionary];
    
    [rootObject setValue: [self accounts] forKey:@"accounts"];
    [NSKeyedArchiver archiveRootObject: rootObject toFile: path];
}

- (void) loadDataFromDisk {
    NSString     * path         = [self pathForDataFile];
    NSLog(@"Loading accounts from file '%@'", path);
	
    NSDictionary * rootObject;
    
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    self.accounts = [rootObject valueForKey:@"accounts"];
    NSLog(@"Loaded accounts %@", accounts);
    if (self.accounts == nil) {
        self.accounts = [[NSMutableDictionary alloc] init];  
     }
}
```
    

Now to save the account data to data.bin in the app's Documents folder you only have to call **\[self saveDataToDisk\]**, or if you're doing it from a controller use this:


```objectivec
TheAppDelegate *delegate = (TheAppDelegate *)[UIApplication sharedApplication].delegate;
[delegate saveDataToDisk];
```
    

The code was adapted from [this article](http://cocoadevcentral.com/articles/000084.php).

