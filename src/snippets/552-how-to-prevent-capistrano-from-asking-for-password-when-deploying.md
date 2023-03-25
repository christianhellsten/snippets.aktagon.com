---
id: '552'
title: How to prevent Capistrano from asking for password when deploying
languages:
- ruby
tags:
---
Capistrano might ask for a password when:


```ruby
# Capistrano is using sudo, so set it to false
set :use_sudo, false

# Your remote server is trying to checkout an SSH protected Git repository
set :repository, '/var/git/repositories/xxx.git' # Remote server also holds the git repository
set :local_repository, 'ssh://xxx/var/git/repositories/xxx.git' # Your development machine points to the remote machine 

# SSH settings, also see ~/.ssh/config
set :user, "jebus"
set :domain, 'xxx.com'
set :port, 666

# Other settings worth checking
ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
default_run_options[:pty] = true # see http://www.mail-archive.com/capistrano@googlegroups.com/msg07323.html for details
```
    

Reference
---------

[How to setup a password-less “cap deploy” with Capistrano](http://www.rubyfleebie.com/how-to-setup-a-password-less-cap-deploy-with-capistrano/)

