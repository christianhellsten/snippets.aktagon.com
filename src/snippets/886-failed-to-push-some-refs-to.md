---
id: '886'
title: failed to push some refs to
languages:
- bash
tags:
---
git push fails:

```bash
❯ git push
To github.com:xxx/yyy.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:xxx/yyy.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

Use pull and rebase to rewind and replay your commit, otherwise you will end up with a "merge commit" in your git history:

```bash
❯ git pull --rebase
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 3 (delta 2), pack-reused 0
Unpacking objects: 100% (3/3), done.
From github.com:xxx/yyy
   aaa..bbb  master     -> origin/master
First, rewinding head to replay your work on top of it...
Applying: <Your commit message>.
```

How to Undo Almost Anything With Git:
https://github.blog/2015-06-08-how-to-undo-almost-anything-with-git/

Git Pretty - Git Flowchart:
http://justinhileman.info/article/git-pretty/

Oh Shit, Git!?!:
https://ohshitgit.com/
