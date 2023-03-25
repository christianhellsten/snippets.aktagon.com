---
id: '388'
title: How to fix issues with missing gem specifications
languages:
- bash
tags:
---
I was getting this error after unpacking hpricot with **gem unpack hpricot**. I also tried **rake gems:unpack hpricot** but it did nothing...


```bash
config.gem: Unpacked gem hpricot-0.8.1 in vendor/gems has no specification file. Run 'rake gems:refresh_specs' to fix this.
```
    

The rake gems:refresh\_specs command doesn't work, and appears to have been a temporary workaround, so to fix this error I did this:


```bash
cd vendor/gems/hpricot-0.8.1
gem specification hpricot > .specification
```
    

I had this issue with Rails 2.3.4.

