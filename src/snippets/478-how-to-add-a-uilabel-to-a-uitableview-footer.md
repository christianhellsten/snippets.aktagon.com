---
id: '478'
title: How to add a UILabel to a UITableView footer
languages:
- objectivec
tags:
---

```objectivec
UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
label.text = @"It was a very long book with many lines...";
// Colors and font
label.backgroundColor = [UIColor clearColor];
label.font = [UIFont systemFontOfSize:13];
label.shadowColor = [UIColor colorWithWhite:0.8 alpha:0.8];
label.textColor = [UIColor blackColor];
// Automatic word wrap
label.lineBreakMode = UILineBreakModeWordWrap;
label.textAlignment = UITextAlignmentCenter;
label.numberOfLines = 0;
// Autosize
[label sizeToFit];
// Add the UILabel to the tableview
self.tableView.tableFooterView = label;
```
    

To add the footer to a specific section use the viewForFooterInSection method:


```objectivec
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
...
        [footerView addSubview:xxx];
...
}
```
    

