---
id: '847'
title: Kill Mac OS disk warning notification
languages:
- bash
tags:
---
This explains how you can kill the Mac OS disk warning notification that reminds you that you need to buy more overpriced hardware with more disk space from Apple even if you have plenty of disk space left on your brand new Apple crippleware computer.

Before Mac OS Mojave this used to work:

```bash
# 1 = 1Gb
$ defaults write com.apple.diskspaced minFreeSpace 1
$ killall diskspaced
```

Setting minFreeSpace to 1 prevents the notification from showing up every second, if free disk space is above 1 Gb.

With Mojave we have to completely disable the agent:

```bash
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.diskspaced.plist
```

Tested on Mac OS Mojave and iMac crippleware.

See:

https://apple.stackexchange.com/questions/254485/silencing-your-disk-is-almost-full-notification

https://apple.stackexchange.com/questions/345120/silencing-your-disk-is-almost-full-notification
