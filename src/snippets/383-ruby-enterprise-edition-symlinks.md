---
id: '383'
title: Ruby Enterprise Edition symlinks
languages:
- bash
tags:
---
This will save you from playing with PATH:


```bash
sudo ln -fs /opt/ruby-enterprise-1.8.6-20090610 /opt/ruby-enterprise
sudo ln -fs /opt/ruby-enterprise/bin/gem /usr/bin/gem
sudo ln -fs /opt/ruby-enterprise/bin/irb /usr/bin/irb
sudo ln -fs /opt/ruby-enterprise/bin/rake /usr/bin/rake
sudo ln -fs /opt/ruby-enterprise/bin/rails /usr/bin/rails
sudo ln -fs /opt/ruby-enterprise/bin/ruby /usr/bin/ruby
```
    

Passsenger.conf is also simplified:


```bash
LoadModule passenger_module /opt/ruby-enterprise/lib/ruby/gems/1.8/gems/passenger-2.2.5/ext/apache2/mod_passenger.so
PassengerRoot /opt/ruby-enterprise/lib/ruby/gems/1.8/gems/passenger-2.2.5
PassengerRuby /opt/ruby-enterprise/bin/ruby
```
    

