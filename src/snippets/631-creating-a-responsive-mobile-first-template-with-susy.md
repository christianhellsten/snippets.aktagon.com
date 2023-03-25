---
id: '631'
title: Creating A Responsive Mobile-First Template with Susy
languages:
- css
tags:
---
Susy version 1:


```css
// http://susy.oddbird.net/tutorial/
@import "susy/sass/_susy"
@include border-box-sizing

$show-grid-backgrounds: true

// Mobile-first grid
$total-cols             : 4 
$col-width              : 4em
$gutter-width           : 1em
$side-gutter-width      : $gutter-width
$container-style        : static

// Tablet grid
$tablet-cols	  : 10
// 768px
$tablet-width	  : 48em
$tablet         : $tablet-width $tablet-cols
 
$desktop-cols   : 12
// 960px
$desktop-width	: 60em
$desktop        : $desktop-width $desktop-cols

.container
  // Tell susy we have 3 different layouts
  @include container($total-cols, $tablet-cols, $desktop-cols)
  @include susy-grid-background

  // Mobile phones
  #content 
    @include span-columns(4, 4)
  #sidebar 
    @include span-columns(4, 4)

  // Tablets
  @include at-breakpoint($tablet)
    @include container

    #content 
      @include span-columns(7, $tablet-cols)
    #sidebar 
      @include span-columns(3 omega, $tablet-cols)

  // Desktops
  @include at-breakpoint($desktop)
    @include container
    #content 
      @include span-columns(8, $desktop-cols)
    #sidebar 
      @include span-columns(4 omega, $desktop-cols)
```
    

Susy version 2????

