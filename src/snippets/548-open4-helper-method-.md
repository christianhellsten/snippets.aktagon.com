---
id: '548'
title: 'Open4 helper method '
languages:
- ruby
tags:
- amqp
- exactly-once
- messaging
- rabbitmq
- reconciliation
---

```ruby
def execute(cmd)
  pid, stdin, stdout, stderr = Open4::popen4("#{cmd} 2>&1") # Redirect stderr to stdout
  ignored, status = Process::waitpid2(pid)
  raise "'#{cmd.gsub(/\s+/, ' ')}' exited with status #{status}. Details:\n\n#{stdout}" if status != 0
  [status, stdout.read.strip]
end
```
    

