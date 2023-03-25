---
id: '193'
title: MySQL backup with Auto MySQL Backup
languages:
- bash
tags:
---
http://sourceforge.net/projects/automysqlbackup/


```bash
cd /etc/mysql
wget http://garr.dl.sourceforge.net/sourceforge/automysqlbackup/automysqlbackup.sh.2.5

ln -s automysqlbackup.sh.2.5 backup-script
chmod 740 backup-script

vim backup-script
```
    

Next tell cron to run it 4 in the morning:


```bash
crontab -e
```
    

Add the following line:


```bash
0 4 * * * /etc/mysql/backup-script
```
    

