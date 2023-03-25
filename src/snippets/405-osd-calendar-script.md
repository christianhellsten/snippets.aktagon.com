---
id: '405'
title: OSD calendar script
languages:
- bash
tags:
- corrupt
- git
- repository
---
Hook this script to your favourite keybinding to get an OSD calendar on your screen. The calendar modification used was found [here](http://www.macosxhints.com/article.php?story=20091014220449591).

*osd\_cal.sh*


```bash
#!/bin/bash
font="-*-*-medium-*-*-*-20-*-*-*-*-*-*-*"
month=date "+%m" 
cal_head=cal -m $month | head -1 
cal_tail=cal -m $month | tail -7
today=date "+%e"| sed 's/^ *//;s/ *$//'
cal="$cal_head\n" 
cal+=$(echo -en "${cal_tail/${today}/*${today}}\n")
$(echo -e "$cal" | osd_cat -c white -l 8 -i 10 -o 10 -f $font -p bottom -A right -s 1)
```
    

This is how I hooked it to Mod+c in [dwm](http://dwm.suckless.org/).

*config.h*


```bash
// ... abbreviated
static const char *calcmd[]  = { "osd_cal.sh",NULL };
static Key keys[] = {
// ...abbr
{ MODKEY,                       XK_c,      spawn,          {.v = calcmd } },
// ...abbr
// ... abbreviated
```
    

