---
id: '263'
title: How to change the Apache 2 server signature on Debian Etch
languages:
- apacheconf
tags:
- crack
- hashcat
- md5
---
[Install mod\_security](http://www.howtoforge.com/apache2_mod_security_debian_etch), for some stupid reason it's not included in Debian Etch, and for some even more stupid reason you're not allowed to change the value of the Server header.

Anyway, to change the server signature, and enable voodoo magic:


```apacheconf
<IfModule mod_security2.c>
    # Basic configuration options
    SecRuleEngine On
    SecRequestBodyAccess On
    SecResponseBodyAccess Off

    # Handling of file uploads
    # TODO Choose a folder private to Apache.
    # SecUploadDir /opt/apache-frontend/tmp/
    SecUploadKeepFiles Off

    # Debug log
    SecDebugLog /var/log/apache2/modsec_debug.log
    SecDebugLogLevel 0

    # Serial audit log
    SecAuditEngine RelevantOnly
    SecAuditLogRelevantStatus ^5
    SecAuditLogParts ABIFHZ
    SecAuditLogType Serial
    SecAuditLog /var/log/apache2/modsec_audit.log

    # Maximum request body size we will
    # accept for buffering
    SecRequestBodyLimit 131072

    # Store up to 128 KB in memory
    SecRequestBodyInMemoryLimit 131072

    # Buffer response bodies of up to
    # 512 KB in length
    SecResponseBodyLimit 524288

    SecServerSignature "Dummy value"
</IfModule>
```
    

