---
id: '849'
title: Log shipping with rsyslog
languages:
tags:
---
## Server

/etc/rsyslog.conf

```
$ModLoad imtcp
 
#
# Disable rate-limiting
#
# "interval = 1 AND burst = 1000" means rsyslog starts dropping messages if more than 1000 messages are received within 1 seconds. 
$SystemLogRateLimitInterval 0
$SystemLogRateLimitBurst 0
```

/etc/rsyslog.d/35-remote-logs.conf

```
input(type="imtcp" port="514" ruleset="remote")
template(name="PerRemoteHostLogFileName" type="list") {
   constant(value="/var/log/hosts/")
   property(name="$year")
   constant(value="/")
   property(name="$month")
   constant(value="/")
   property(name="hostname" securepath="replace")
   constant(value="/")
   property(name="programname" securepath="replace")
   constant(value=".log")
}
ruleset(name="remote") {
   $FileCreateMode 0640
   $DirCreateMode 0755
   ?PerRemoteHostLogFileName
}
```

## Client

/etc/rsyslog.conf

```
# Disable rate-limiting
$SystemLogRateLimitInterval 0
$SystemLogRateLimitBurst 0

#
# Send all logs to centralized log server over TCP
#
*.*       @@{{log_server_ip_addr}}
```
