---
id: '810'
title: How to get the latest version number from a list of git tags
languages:
- bash
tags:
---
This will print the latest version number that a git repository has been tagged with:
```bash
$ git tag -l 'v*' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | tail -n 1
v1.5.6
```

Note that some versions of the sort command have a --version-sort switch, and some don't:
```bash
sort: unrecognized option `--version-sort'
Try `sort --help' for more information.
```
