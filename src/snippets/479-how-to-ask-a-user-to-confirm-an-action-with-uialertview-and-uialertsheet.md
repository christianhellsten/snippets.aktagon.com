---
id: '479'
title: How to ask a user to confirm an action with UIAlertView and UIAlertSheet
languages:
- objectivec
tags:
- bash
- nc
- network
- telnet
- zsh
---
UIAlertView
-----------


```objectivec
-(void) confirmDelete {
	UIAlertView *alertView = [[UIAlertView alloc]
            initWithTitle:@"Remove account"	
            message:@"Are you sure you want to remove this account?"
            delegate:self
            cancelButtonTitle:@"Remove"
            otherButtonTitles:nil];
	
	[alertView addButtonWithTitle:@"Don't remove"];
	[alertView show];
	[alertView release];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	[appDelegate.managedObjectContext deleteObject:selectedAccount];
	if (buttonIndex == 0) {
		NSLog(@"Remove button clicked");
	} else if (buttonIndex == 1) {
		NSLog(@"Cancel button clicked");
	}
}
```
    

UIAlertSheet
------------


```objectivec
-(void)confirmDelete {
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Remove account?" delegate:self cancelButtonTitle:@"Don't remove" destructiveButtonTitle:@"Remove account" otherButtonTitles:nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;	
	[actionSheet showInView:[UIApplication sharedApplication].keyWindow];	
	[actionSheet release];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		NSLog(@"Remove button clicked");
	} else if (buttonIndex == 1) {
		NSLog(@"Cancel button clicked");
	}
}
```
    

