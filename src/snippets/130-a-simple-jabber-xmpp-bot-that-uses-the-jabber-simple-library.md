---
id: '130'
title: A simple Jabber/XMPP bot that uses the Jabber:Simple library
languages:
- ruby
tags:
- racket
---
First install [Jabber::Simple](http://xmpp4r-simple.rubyforge.org/):


```ruby
$sudo gem install xmpp4r-simple -y
```
    

On OSX you might get this error when installing xmpp4r-simple and the rdoc dependency:


```ruby
make
gcc -I. -I/usr/local/lib/ruby/1.8/i686-darwin8.10.3 -I/usr/local/lib/ruby/1.8/i686-darwin8.10.3 -I.  -fno-common -g -O2  -fno-common -pipe -fno-common  -c callsite.c
gcc -I. -I/usr/local/lib/ruby/1.8/i686-darwin8.10.3 -I/usr/local/lib/ruby/1.8/i686-darwin8.10.3 -I.  -fno-common -g -O2  -fno-common -pipe -fno-common  -c rcovrt.c
cc -dynamic -bundle -undefined suppress -flat_namespace  -L"/usr/local/lib" -o rcovrt.bundle callsite.o rcovrt.o  -lruby  -lpthread -ldl -lobjc  
/usr/bin/ld: /usr/lib/gcc/i686-apple-darwin8/4.0.1/../../../libpthread.dylib unknown flags (type) of section 6 (__TEXT,__dof_plockstat) in load command 0
/usr/bin/ld: /usr/lib/gcc/i686-apple-darwin8/4.0.1/../../../libdl.dylib unknown flags (type) of section 6 (__TEXT,__dof_plockstat) in load command 0
/usr/bin/ld: /usr/lib/gcc/i686-apple-darwin8/4.0.1/../../../libobjc.dylib load command 9 unknown cmd field
/usr/bin/ld: /usr/lib/gcc/i686-apple-darwin8/4.0.1/../../../libSystem.dylib unknown flags (type) of section 6 (__TEXT,__dof_plockstat) in load command 0
/usr/bin/ld: /usr/lib/libSystem.B.dylib unknown flags (type) of section 6 (__TEXT,__dof_plockstat) in load command 0
collect2: ld returned 1 exit status
make: *** [rcovrt.bundle] Error 1
```
    

Simply install XCode 3 to make the error go away, then run this code to start the bot--warning the bot will execute the message body, for example "ls -la", on the system:


```ruby
require 'rubygems'
require 'xmpp4r-simple'

include Jabber
#Jabber::debug = true

jid = 'user@server.com'
pass = 'password'

jabber = Simple.new(jid, pass)

loop do
  messages = jabber.received_messages
  messages.each do |message| 
    body = message.body if message.type == :chat
    
    process = IO.popen(body)
    result = process.readlines
    
    jabber.deliver('some.user@gmail.com', result)
  end
      
  sleep 1
end
```
    

To use GTalk from another domain than gmail, you need to edit the Jabber::Simple source code...

