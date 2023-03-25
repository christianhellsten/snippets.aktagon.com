---
id: '783'
title: How to use fswatch to run a command when a file is changed
languages:
- bash
tags:
---
This example executes the the rspec command when a Ruby file is modified in the current directory:
```bash
# watch .rb files in spec directory and execute rspec <file>
fswatch -0 -e ".*" -i ".rb" . | xargs -0 -n 1 -I {} rspec {}
```

Note that fswatch will execute test concurrently if the same test file is changed again before the previous test has time to complete.
