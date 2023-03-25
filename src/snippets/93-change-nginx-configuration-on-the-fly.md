---
id: '93'
title: Change nginx configuration on the fly
languages:
- bash
tags:
---
First make your changes to nginx.conf.

Then run the following command to test the new configuration:


```bash
# nginx -t -c /etc/nginx/nginx.conf 
2007/10/18 20:55:07 [info] 3125#0: the configuration file /etc/nginx/nginx.conf syntax is ok
2007/10/18 20:55:07 [info] 3125#0: the configuration file /etc/nginx/nginx.conf was tested successfully
```
    

Next, look for the process id of the master nginx process:


```bash
# ps -ef|grep nginx
root      1911     1  0 18:00 ?        00:00:00 nginx: master process /usr/sbin/nginx
www-data  1912  1911  0 18:00 ?        00:00:00 nginx: worker process
```
    

Lastly, tell nginx to reload the configuration and restart the worker processes:


```bash
# kill -HUP 1911
```
    

