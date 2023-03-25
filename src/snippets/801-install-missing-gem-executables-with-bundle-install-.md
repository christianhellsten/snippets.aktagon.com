---
id: '801'
title: Install missing gem executables with `bundle install`
languages:
- bash
tags:
---
When:
```bash
$ bundle exec cucumber

bundler: command not found: cucumber
Install missing gem executables with `bundle install`
```

Do:
```bash
$ rm .bundle/config # remove a broken bundler configuration
$ gem update --system # might help if rubygems is outdated / broken
$ gem update bundler # might help if bundler is outdated / broken
$ bundle install # dependency hell
```

Or, start using, e.g., golang, crystal, etc.
