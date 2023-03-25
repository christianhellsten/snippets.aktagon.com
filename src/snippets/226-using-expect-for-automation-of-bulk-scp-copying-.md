---
id: '226'
title: Using expect for automation of bulk scp copying.
languages:
- bash
tags:
---
Expect can come in handy when you can't configure ssh public key authentication on the servers :) (and the system "architect" hasn't yet realized the wonderfulness of a log host).


```bash
#!/bin/bash
#
# Usage: script <username> <password> <build>
#
# Example ./copy_logs_from_production.sh marko hubbabubba current
#

username=$1
password=$2
build=$3
mkdir $build

instance_1_server=10.0.0.1
instance_2_server=10.0.0.1
instance_3_server=10.0.0.2
instance_4_server=10.0.0.2
instance_5_server=10.0.0.3
instance_6_server=10.0.0.3
instance_7_server=10.0.0.4
instance_8_server=10.0.0.4
instance_9_server=10.0.0.5

servers=("$instance_1_server" "$instance_2_server" "$instance_3_server" "$instance_4_server" "$instance_5_server" "$instance_6_server" "$instance_7_server" "$instance_8_server" "$instance_9_server" )
i=1
for server in ${servers[@]}; do
  expect -c "
            # exp_internal 1 # uncomment for debugging
            spawn /usr/bin/scp $username@$server:/var/logs/application/$build/server${i}/error.log $build/error-${i}.log
            expect { 
              "*password:*" { send $password\r\n; interact } 
              eof { exit }
            }
            exit
            "
  let "i=i+1"
done
```
    

