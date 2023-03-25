---
id: '28'
title: Display the change log (revision history) for a Mercurial repository
languages:
- bash
tags:
---
Use the following command to print a list of changes (revision history) for a Mercurial repository:


```bash
$ hg log
```
    

The output looks like this:


```bash
changeset:   35:5a17500addb5
tag:         tip
user:        christian@localhost
date:        Fri Jun 29 23:33:59 2007 +0300
summary:     Changed mongrel_cluster configuration

changeset:   34:a73ee17923fe
user:        christian@localhost
date:        Fri Jun 29 23:28:36 2007 +0300
summary:     Fixed bugs.
```
    

In the example there are two revisions 35 and 34. Use the following command to display the details for revision 34:


```bash
$ hg log -p -r34
```
    

The output is a [unified diff](http://hgbook.red-bean.com/hgbookch12.html#x16-27100012.4) for the changeset and looks like this:


```bash
changeset:   34:a73ee17923fe
user:        christian@localhost
date:        Fri Jun 29 23:28:36 2007 +0300
summary:     Fixed bugs.

diff -r 4c44552841af -r 4e57a76f51d9 lib/daemons/deleted_unused_tags.rb
--- a/lib/daemons/deleted_unused_tags.rb        Sat Jun 23 23:58:38 2007 +0300
+++ b/lib/daemons/deleted_unused_tags.rb        Sun Jun 24 00:03:43 2007 +0300
@@ -11,10 +11,7 @@ end
 end
```
    

