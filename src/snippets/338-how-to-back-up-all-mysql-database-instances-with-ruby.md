---
id: '338'
title: How to back up all MySQL database instances with Ruby
languages:
- ruby
tags:
---

```ruby
require 'rubygems'
require 'sequel'
require 'expect'
require 'pty'
require 'pp'

#$expect_verbose = true 

def exec_pty(cmd)
  PTY.spawn(cmd) do |reader, writer, pid|
    reader.expect(/Enter password/) do |line|
      writer.puts ''
    end 

    while line=reader.gets
#      print line
    end
  end 
end

user      = 'fuuuuuck'
password  = ''
host      = 'localhost'
encoding  = 'utf8'
dir       = '/tmp'
timestamp = Time.now.strftime('%d-%m-%y')

connection = Sequel.mysql nil, :user => user, :password => password, :host => host, :encoding => encoding

databases = []
connection['show databases;'].each do |db|
  databases << db[:Database]
end
databases = databases - ['mysql', 'test', 'information_schema']


databases.each do |db|

  file = File.join(dir, "#{db}_#{timestamp}.sql")
  p file
  cmd = "mysqldump -u#{user} -p#{password} -h#{host} -Q -c -C --add-drop-table --add-locks --quick --lock-tables #{db} > #{file}"

  
  result = exec_pty(cmd)
end
```
    

