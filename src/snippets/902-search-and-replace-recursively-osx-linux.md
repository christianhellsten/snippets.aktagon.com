---
id: '902'
title: Search and replace recursively OSX / Linux
languages:
- shell
tags:
---
```shell
find . -name "*.yaml" | xargs perl -p -i -e "s/foo/buzz/g"
find . -type f -name "*.yaml" -print0 | xargs -0 sed -i '' -e 's/foo/bar/g'
```

I recommend installing and using repren if you need a simpler solution:
https://github.com/jlevy/repren

Reference:

- https://stackoverflow.com/a/8575384
- https://superuser.com/questions/428493/how-can-i-do-a-recursive-find-and-replace-from-the-command-line
