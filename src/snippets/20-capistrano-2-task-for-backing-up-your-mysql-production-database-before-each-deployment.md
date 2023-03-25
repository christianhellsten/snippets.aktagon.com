---
id: '20'
title: Capistrano 2 task for backing up your MySQL production database before each
  deployment
languages:
- ruby
tags:
- alert
- cron
- notify
---
This Capistrano task connects to your production database and dumps the contents to a file. The file is compressed and put in a directory specified with **set :backup\_dir, "\#{deploy\_to}/backups"**. This is a slight modification of <http://pastie.caboo.se/42574>. All credit to [court3nay](http://pastie.caboo.se/author/court3nay).


```ruby
task :backup, :roles => :db, :only => { :primary => true } do
  filename = "#{backup_dir}/#{application}.dump.#{Time.now.to_f}.sql.bz2"
  text = capture "cat #{deploy_to}/current/config/database.yml"
  yaml = YAML::load(text)

  on_rollback { run "rm #{filename}" }
  run "mysqldump -u #{yaml['production']['username']} -p #{yaml['production']['database']} | bzip2 -c > #{filename}" do |ch, stream, out|
    ch.send_data "#{yaml['production']['password']}\n" if out =~ /^Enter password:/
  end
end
```
    

To automatically backup your data before you deploy a new version add this to **config/deploy.rb**:


```ruby
task :before_deploy do
    backup
  end
```
    

To restore the backup run the following command:


```ruby
mysql database_name -uroot < filename.sql
```
    

