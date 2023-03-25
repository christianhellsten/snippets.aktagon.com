---
id: '609'
title: Slow IO performance with Vagrant and VirtualBox?
languages:
tags:
---
To fix slow IO performance with Vagrant and VirtualBox, start by reading the documentation:
<http://docs-v1.vagrantup.com/v1/docs/host_only_networking.html>

It’s a long known issue that VirtualBox shared folder performance degrades quickly as the number of files in the shared folder increases. As a project reaches 1000+ files, doing simple things like running unit tests or even just running an app server can be many orders of magnitude slower than on a native filesystem (e.g. from 5 seconds to over 5 minutes).

If you’re seeing this sort of performance drop-off in your shared folders, NFS shared folders can offer a solution. Vagrant will orchestrate the configuration of the NFS server on the host and will mount of the folder on the guest for you.

Example NFS configuration:


```
Vagrant::Config.run do |config|
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
end
```
    

After this run:


```
vagrant reload
```
    

On OSX you can check that the folder is mounted properly with:


```
showmount -e
```
    

Or check /etc/exports

On Linux use:


```
sudo mount
```
    

Or check /etc/fstab

