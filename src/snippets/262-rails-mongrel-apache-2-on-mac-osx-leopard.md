---
id: '262'
title: Rails+Mongrel+Apache 2 on Mac OSX Leopard
languages:
- apacheconf
tags:
---
I use this configuration on my development machine when I need mod\_rewrite; it's not meant for production:


```apacheconf
<VirtualHost *:80>
ServerName dev.xxx.com

# Enable URL rewriting
RewriteEngine On

# Rewrite index to check for static pages
RewriteRule ^/$ /index.html [QSA]

# Rewrite to check for Rails cached page
RewriteRule ^([^.]+)$ $1.html [QSA]

# Redirect all non-static requests to cluster
RewriteCond %{DOCUMENT_ROOT}/%{REQUEST_FILENAME} !-f
RewriteRule ^/(.*)$ balancer://mongrel_cluster%{REQUEST_URI} [P,QSA,L]

DocumentRoot  "/Users/christian/Documents/Projects/xxx/public"
<Directory "/Users/christian/Documents/Projects/xxx/public">
     Options Indexes FollowSymLinks

     AllowOverride None
     Order allow,deny
     Allow from all
 </Directory>

</VirtualHost>

<Proxy balancer://mongrel_cluster>
  BalancerMember http://127.0.0.1:3000
</Proxy>
```
    

