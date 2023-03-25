---
id: '73'
title: Implementing hanging bullets with CSS
languages:
- css
tags:
- ansible
- certificates
- ssl
- vault
---
According to Mark Boulton's article [Five simple steps to better typography - part 2](http://www.markboulton.co.uk/journal/comments/five_simple_steps_to_better_typography_part_2/), the text in bulleted lists should be left-aligned with the surrounding text; this is rarely the case on the web, but is easily achievable by using the following CSS style:


```css
ul {
  list-style-position: outside;
  margin-left: 0px;
}
```
    

