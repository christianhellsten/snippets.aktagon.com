---
id: '861'
title: Search and replace file contents and file names
languages:
- bash
tags:
---
## Search and replace file contents

```bash
# Replace Tree with Trees
# NOTE: If you want to backup the files, change -i '' to -i (without empty string)
grep -rl Tree . |xargs sed -i '' -e 's/Tree/Trees/'
```

## Search and replace of file names

```bash
find . -name '*observation*' -exec bash -c 'mv $0 ${0/observation/condition}' {} \;
```

References
https://www.commandlinefu.com/commands/matching/search-replace/c2VhcmNoIHJlcGxhY2U=/sort-by-votes
