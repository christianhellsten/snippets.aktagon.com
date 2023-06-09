---
id: '780'
title: Using rsyslog for remote logging (Rails and Haproxy)
languages:
- bash
- ruby
tags:
---
First, consider using rsyslog's imfile module to send log files to rsyslog instead of configuring Rails/Ruby to send log messsages to rsyslog: http://www.rsyslog.com/doc/v8-stable/configuration/modules/imfile.html

Second, read "Reliable Forwarding of syslog Messages with Rsyslog":
https://www.rsyslog.com/doc/v8-stable/tutorials/reliable_forwarding.html

Also see Filebeat:
https://www.elastic.co/products/beats/filebeat

If you still want to Ruby to send the log messages to rsyslog, you need to tell your application to send log messages to syslog:

```ruby
#
# Example in config/production.rb:
#
#   config.logger = LogHelper.open
#   config.log_tags = [ :uuid, :remote_ip ]
#
require 'syslog/logger'

class LogHelper
  PROGRAM_NAME = "rails"
  LEVEL = Logger::DEBUG

  # Maps syslog severity to a string
  SEVERITY_MAP = {
    0 => 'debug',
    1 => 'info',
    2 => 'warn',
    3 => 'error',
    nil => ''
  }.freeze

  def self.open
    # There can only be one program name
    l = Syslog::Logger.new(PROGRAM_NAME)
    l.formatter = proc do |severity, datetime, progname, msg|
      "[#{SEVERITY_MAP[severity].center(5)}] #{msg}\n"
    end
    l.level = LEVEL
    # Add tags to log messages from thread local context, e.g., request.uuid
    ActiveSupport::TaggedLogging.new(l)
  end
end
```

Example:

```ruby
logger = LogHelper.open
logger.info("test")
```

## Install and configure the rsyslog server

Next install rsyslog on the server:

```bash
$ sudo apt-get install rsyslog
```

Uncomment the TCP module:
```
# provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514
```

Comment out the *IncludeConfig* directive:
```
# $IncludeConfig /etc/rsyslog.d/*.conf
```

We'll use a DynaFile to simplify the rsyslog configuration:
```
$template DynaFile,"/var/log/hosts/%HOSTNAME%/%PROGRAMNAME%.log"
*.* -?DynaFile
```

This tells rsyslog to write to a file named after the host and program that sent the message, e.g., /var/log/hosts/prod-1/rails.log.

## Install and configure rsyslog clients

The naming of rsyslog configuration files IS important. Rules are processed in alphabetic order according to file name:

```
$ ls /var/rsyslog.d/
/etc/rsyslog.d/10-app.conf
/etc/rsyslog.d/50-default.conf
```

First, tell syslog to forward everything to the remote rsyslog server by editing /etc/rsyslog.conf:
```
#
# Send all logs to centralized log server over TCP
#
*.*       @@192.168.0.0

#
# Include all config files in /etc/rsyslog.d/
#
$IncludeConfig /etc/rsyslog.d/*.conf
```

You can configure application logs to be written to a local file in addition to the default (remote server):
```
if $programname startswith 'rails' then {
  /var/log/rails.log
  # Uncomment this to disable forwarding:
  # & stop
}
```
 
## Configure Haproxy

Add [log-send-hostname](http://cbonte.github.io/haproxy-dconv/configuration-1.5.html#3.1-log-send-hostname) to the haproxy configuration.


Haproxy only seems to work with UDP logging, so enable it in /etc/rsyslog.conf:
```
$ModLoad imudp
$UDPServerRun 514
$UDPServerAddress 127.0.0.1
```

# Restarting rsyslog

Remember to restart rsyslog after checking the configuration is valid:
```
$ rsyslogd -N1
$ sudo service rsyslog restart
```

Tested with rsyslog version 8.

## Gotchas

- You will lose log messages because of rsyslog's rate limiting and maximum message size configuration
- Ruby's syslog module only supports one program name
- Make sure to check rsyslog's own logs for warnings
- You probably want to use monit to monitor that rsyslog is writing log messages to disk

