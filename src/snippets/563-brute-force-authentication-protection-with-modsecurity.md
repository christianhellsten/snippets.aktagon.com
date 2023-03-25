---
id: '563'
title: Brute-Force Authentication Protection with ModSecurity
languages:
- apacheconf
tags:
---
IP-Based Blocking
-----------------

The following ModSecurity script protects from brute-force authentication attacks by blocking IPs. It does this by checking the response code sent by the login page (/sessions). HTTP status 200 means a failed authentication attempt. After 3 attempts the IP is blocked.


```apacheconf
<LocationMatch /sessions>
         # Uncomment to troubleshoot
        #SecDebugLogLevel 9
        #SecDebugLog /tmp/troubleshooting.log

        # Enforce an existing IP address block
        SecRule IP:bf_block "@eq 1" \
                "phase:2,deny,\
                msg:'IP address blocked because of suspected brute-force attack'"

        # Check that this is a POST
        SecRule REQUEST_METHOD "@streq POST" "phase:5,chain,t:none,nolog,pass"
                # AND Check for authentication failure and increment counters
                # NOTE this is for a Rails application, you probably need to customize this
                SecRule RESPONSE_STATUS "^200" \
                        "setvar:IP.bf_counter=+1"

        # Check for too many failures from a single IP address. Block for 10 minutes.
        SecRule IP:bf_counter "@ge 3" \
                "phase:5,pass,t:none, \
                setvar:IP.bf_block,\
                setvar:!IP.bf_counter,\
                expirevar:IP.bf_block=600"
</LocationMatch>
```
    

Username-based Blocking
-----------------------

A serious hacker will have billions of IPs, yes billions in the near future, so it's better to block by username. To block usernames, use this script:


```apacheconf
<LocationMatch /sessions>
        # Retrieve the username
        SecAction phase:2,nolog,pass,initcol:USER=%{ARGS.username}

        # Enforce an existing username block
        SecRule USER:bf_block "@eq 1" \
                "phase:2,deny,\
                msg:'Username \"%{ARGS.username}\" blocked because of suspected brute-force attack'"

        # Check that this is a POST
        SecRule REQUEST_METHOD "@streq POST" "phase:5,chain,t:none,nolog,pass"
                # AND Check for authentication failure and increment counters
                # NOTE this is for a Rails application, you probably need to customize this
                SecRule RESPONSE_STATUS "^200" \
                        "setvar:IP.bf_counter=+1"

        # Check for too many failures for a single username
        SecRule USER:bf_counter "@ge 3" \
                "phase:5,t:none,pass,\
                setvar:USER.bf_block,\
                setvar:!USER.bf_counter,\
                expirevar:USER.bf_block=600"
</LocationMatch>
```
    

Password-based Blocking
-----------------------

Hackers might want to try a reverse brute-force attack on passwords, so you could also block multiple failed login attemps that use the same password. Just modify the script to read the password parameter:


```apacheconf
# Retrieve the password parameter
        SecAction phase:2,nolog,pass,initcol:USER=%{ARGS.password}
```
    

Note, you might want to use the RESOURCE collection instead of USER, if you're blocking both usernames and passwords.

On Learning ModSecurity
-----------------------

\* Buy the ModSecurity Handbook
\* Use Lua when possible. ModSecurity rules are severely limited by the Apache configuration language.
\* Use chain for controlling flow. chain = AND operator. OR operator is |.
\* There are 5 collections: GLOBAL, IP, RESOURCE, SESSION, USER. Future versions might give you unlimited collections...
\* Use LocationMatch and SecDebugLog when troubleshooting:


```apacheconf
<LocationMatch /sessions>
        SecDebugLogLevel 9
        SecDebugLog /tmp/troubleshooting.log
```
    

