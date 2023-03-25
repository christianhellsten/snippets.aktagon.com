---
id: '549'
title: Recursive find and replace on OSX/Linux
languages:
- bash
tags:
- celery
- python
---
NOTE: remember to exclude the .git folder...

Search and replace XXX with YYY in all files:

```bash
perl -e "s/XXX/YYY/g;" -pi $(find . -type f)
```

## Troubleshooting

If you get this error:
```bash
zsh: argument list too long: perl
```

Your argument list is clearly too long. Try this instead, or use xargs:
```bash
find . \
   -type f \
   -exec perl -i -pe's/XXX/YYY/g' {} +
```

## Search and Replace with Sed

Using sed is more complicated, but this should at least work on Linux:

```bash
# Find, backup and replace
find . -name "*.rb" -print | xargs sed -i.bak 's/XXX/YYY/g'
# Delete backup files
find . -name '*.bak' -type f -delete
```

[Reference](http://danilo.ariadoss.com/how-to-recursively-remove-ds_store-files-on-mac-os-x/).

Also see:
https://snippets.aktagon.com/snippets/861-search-and-replace-file-contents-and-file-names
