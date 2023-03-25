---
id: '265'
title: How to install sar on Debian
languages:
- bash
tags:
- curator
- elasticsearch
---
First install the sysstat package which includes sar:


```bash
apt-get install sysstat
```
    

Then run crontab -e and add the following to collect stats:


```bash
# Collect measurements at 10-minute intervals
0,10,20,30,40,50   * * * *   /usr/lib/sa/sa1
# Create daily reports and purge old files
0                  0 * * *   /usr/lib/sa/sa2 -A
```
    

You now have access to IO and CPU usage history.

Use this command see the data for the 5th day of the current month:


```bash
sar -f /var/log/sysstat/sa05
```
    

And remember to enable collection of statistics:


```bash
sudo vim /etc/default/sysstat
```
    

