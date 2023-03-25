---
id: '598'
title: Apache+Unicorn
languages:
- apacheconf
tags:
- io-wait
- readable
- ruby
- socket
- writable
---
Configuration for Apache and Unicorn:


```apacheconf
<VirtualHost *:80>
  ServerName    xxx
  ServerAlias   xxx

  <Proxy balancer://unicornservers>
    BalancerMember http://127.0.0.1:5000
  </Proxy>

  RewriteEngine On
  # Static files are served by Apache rest by Unicorn
  RewriteCond %{DOCUMENT_ROOT}/%{REQUEST_FILENAME} !-f
  RewriteRule ^/(.*)$ balancer://unicornservers%{REQUEST_URI} [P,QSA,L]

  # NOTE Uncomment if you want Unicorn to serve static content
  # ProxyPass / balancer://unicornservers/
  # ProxyPassReverse / balancer://unicornservers/
  # ProxyPreserveHost on

  <Proxy *>
    Order deny,allow
    Allow from all
  </Proxy>
</VirtualHost>
```
    

