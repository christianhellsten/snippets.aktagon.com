---
id: '623'
title: How to use Vagrant, Chef and Librarian to set up and configure a development
  environment
languages:
- ruby
tags:
- doorkeeper
- invalid_grant
- oauth2
---
Save this as **Vagrantfile**:


```ruby
# Instructions
# -----------------
# Follow these instructions to set up a new development environment.
#
# Setup tools
# -----------------
# gem install vagrant
#
# # librarian is chef's bundler
# gem install librarian-chef
#
# Install Chef cookbooks
# -----------------
# librarian-chef install
#
# Install VM
# -----------------
# vagrant up
#
# Provision VM, i.e install software with Chef
# -----------------
# vagrant provision
#
# Setup SSH
# -----------------
# vagrant ssh-config >> ~/.ssh/config
#
# sudo echo "10.11.12.13 development" >> /etc/hosts
#
# SSH into your dev environment
# -----------------
# ssh development

Vagrant::Config.run do |config|
 # Configure IP, etc
  config.vm.network :hostonly, "10.11.12.13"
  config.vm.host_name = "development"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  # Use 1GB RAM
  config.vm.customize ["modifyvm", :id, "--memory", 1024] 
  # Link ~/projects on local machine to ~/projects on VM
  config.vm.share_folder "projects", "/home/vagrant/projects", "~/projects", :nfs => true
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/", "1"]
  # Forward ports
  config.vm.forward_port 80, 80
  config.vm.forward_port 6080, 6080
  config.vm.forward_port 8080, 8080
  config.vm.forward_port 3000, 3000
  config.vm.forward_port 9200, 9200
  config.vm.forward_port 8888, 8888

  config.vm.provision :chef_solo, :log_level => :debug do |chef|
    chef.cookbooks_path = "cookbooks"
    #chef.cookbooks_path = ["cookbooks", "vendor/cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "vim"

    chef.add_recipe "build-essential"
    chef.add_recipe "git"
    chef.add_recipe "curl"
    chef.add_recipe "curl::devel"
    chef.add_recipe "java"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::system"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "sqlite"

    chef.add_recipe "nodejs"
    chef.add_recipe "percona::server"
    chef.add_recipe "percona::client"
    chef.add_recipe "elasticsearch"

    # Run rubygems-bundler
    config.vm.provision :shell, :inline => "gem regenerate_binstubs"

    # To install APT packages use:
    #%w(libmysql18-ruby libmysqlclient18-dev).each do |package|
      #config.vm.provision :shell, :inline => "sudo aptitude -y install #{package}"
    #end

    chef.json = { 
      "rbenv" => {
        "rubies" => [ "1.9.3-p448", "2.0.0-p247" ],
        "global" => "2.0.0-p247",
        "gems" => {
          "2.0.0-p247" => [
            { :name => "bundler" }, { :name => "rubygems-bundler" }
          ],
          "1.9.3-p448" => [
            { :name => "bundler" },{ :name => "rubygems-bundler" }
          ]
        }
      }
    }
  end
end
```
    

Save the following in Cheffile:


```ruby
site "http://community.opscode.com/api/v1"

cookbook "percona"

cookbook "rbenv",
  :git => "https://github.com/fnichol/chef-rbenv",
  :ref => "v0.7.2"

cookbook "percona"
cookbook "git"
cookbook "nodejs"
cookbook "ruby_build"
cookbook "sqlite"
cookbook "elasticsearch"
cookbook "curl", git: 'https://github.com/phlipper/chef-curl'
cookbook "build-essential"
cookbook "vim"
cookbook "java"
```
    

Read the instructions in Vagrantfile…

You should now be able to set up a virtual machine that can be used for web development in as long as it takes to compile and install all the software. No extra configuration is needed…

This VM will have software, including:
\* Ubuntu 12.04 Precise, see [vagrantbox.es](http://vagrantbox.es) for other Linux versions
\* Ruby 2 and 1.9 with rbenv
\* Elasticsearch
\* Percona MySQL
\* git and some other tools

