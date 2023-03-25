---
id: '827'
title: How to set the setgid flag with Ansible
languages:
- yaml
tags:
---
This is how to set the setgid flag with Ansible. Tested with Ansible version 2.4.

```yaml
- name: Create directories and set setguid
  file:
    path: "{{item}}"
    state: directory
    owner: www-data
    group: www-data
    # NOTE: 2 = setguid flag. The prefix 0 is required by Ansible
    mode: 02770
    recurse: true
  with_items:
    - /var/www/
  become: true
```

## Reference

Setting the setgid permission on a directory ("chmod g+s") causes new files and subdirectories created within it to inherit its group ID, rather than the primary group ID of the user who created the file (the owner ID is never affected, only the group ID).

See https://en.wikipedia.org/wiki/Setuid
