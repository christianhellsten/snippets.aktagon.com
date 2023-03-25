---
id: '828'
title: Detecting software version with Ansible
languages:
- yaml
tags:
---
With Ansible, detecting the version of, for example, Redis or Racket can be done like this:
```yaml
- name: Detect Redis version
  # Input: Redis server v=3.2.1 sha=00000000:0 malloc=libc bits=64 build=62a67eec83b28403
  # Output: 3.2.1
  shell: redis-server -v | awk '{print $3}' | sed -e 's/v=//'
  changed_when: False
  register: redis_installed_version

- name: Detect racket versions
  # Input: Welcome to Racket v6.6.
  # Output: 6.6
  shell: "racket -v | rev | cut -d ' ' -f1 | rev | sed 's/.$//' | sed 's/^v//'"
  register: racket_installed_version
```

Example: Download src only if version does not match:

```yaml
- get_url:
    url: http://download.redis.io/releases/redis-{{redis_version}}.tar.gz
    dest: /usr/local/src/
    sha256sum: "{{redis_sha256}}"
  register: get_redis_result
  when: redis_installed_version.stdout | version_compare(redis_version, '!=')
```
