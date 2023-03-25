---
id: '884'
title: Running Rubocop on commit, changes, or branch
languages:
tags:
---
- To RuboCop the current commit

```
git diff-tree --no-commit-id --name-only -r HEAD --diff-filter AMT | xargs bundle exec rubocop
```

- To RuboCop the working tree changes

```
git diff --name-only --diff-filter AMT | xargs bundle exec rubocop
```

- To RuboCop all of the changes from the branch

```
git diff --name-only master --diff-filter AMT | xargs bundle exec rubocop
```

From https://about.gitlab.com/handbook/tools-and-tips/rubocop/

Also see:

- https://github.com/danger/danger
- https://github.com/danger/awesome-danger
- https://github.com/prontolabs/pronto
- https://github.com/prontolabs/pronto#runners
- https://github.com/danger/danger-gitlab-gem
