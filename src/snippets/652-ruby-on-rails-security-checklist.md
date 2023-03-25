---
id: '652'
title: Ruby on Rails Security Checklist
languages:
- ruby
tags:
---
Checklist
---------

\* Don't store passwords (config/database.yml, db/seeds.rb), API keys (Amazon AWS), the Rails secret token (config/initializers/secret\_token.rb), etc in version control.
\* Don't store production passwords and API keys on developer laptops.
\* Inject secrets, API keys, etc with e.g. [dotenv](https://github.com/bkeepers/dotenv)
\* Don't import production data to other environments without obfuscating or cleaning data.
\* Use a different secret token in production than staging, development, and other environments.
\* AR serialize and store (YAML) is using eval. Don't use YAML, use JSON.
\* Don't write redirect\_to params\[:url\]. If you have to then add **only\_path: true**, or use **URI.parse** to get the path component.
\* ActiveRecord is not safe from SQL injection. See <http://rails-sqli.org> for details.
\* Enforce password strength.
\* Set cookie timeout **expire\_after: 30.minutes**.
\* Hash passwords before storing them in a database (**has\_secure\_password**).
\* Don't use GET for actions that change data ([RequestForgeryProtection](http://api.rubyonrails.org/classes/ActionController/RequestForgeryProtection.html)).
\* Uploaded files should be sanitized, name, path, etc.
\* Downloads of uploaded files should most likely be authorized ([send\_file](http://api.rubyonrails.org/classes/ActionController/DataStreaming.html#method-i-send_file) , [Downloads done right](http://www.therailsway.com/2009/2/22/file-downloads-done-right/)).

Recommended Software
--------------------

\* secure\_headers gem (Content Security Policy)
\* mod\_security (Apache & nginx web application firewall)
\* rack::attack gem (Similar to mod\_security)
\* bundler\_audit gem (Checks Gemfile.lock for vulnerable gems)

Further resources
-----------------

\* [Ruby on Rails Security Guide](http://guides.rubyonrails.org/security.html)
\* [XSS (Cross Site Scripting) Prevention Cheat Sheet
](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet)
\* [Cross-Site Request Forgery (CSRF) Prevention Cheat Sheet](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet)
\* [DOM based XSS Prevention Cheat Sheet](https://www.owasp.org/index.php/DOM_based_XSS_Prevention_Cheat_Sheet)
\* [HTML5 Security Cheat Sheet](https://www.owasp.org/index.php/HTML5_Security_Cheat_Sheet)
\* [SQL Injection Prevention Cheat Sheet](https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet)
\* [Attack Surface Analysis Cheat Sheet](https://www.owasp.org/index.php/Attack_Surface_Analysis_Cheat_Sheet)
\* [Ruby on Rails Cheatsheet](https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet)
\* <http://12factor.net/config>
\* <http://gauntlt.org/>


```ruby

```
    

