---
id: '678'
title: Consistent Spacing Between Elements in Zurb Foundation
languages:
tags:
---
The width of column gutters is defined in \_settings.scss :


```
$column-gutter: rem-calc(30);
```
    

Use the $column-gutter variable for calculating spacing between elements, for example:


```
.header, .carousel {
  margin-bottom: $colum-gutter;
}
```
    

