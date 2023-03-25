---
id: '896'
title: How to use private Github repositories with Bundler
languages:
- bash
tags:
---
Does your Gemfile reference private Github repositories?

**Option 1: ENV variable**

```bash
export BUNDLE_GITHUB__COM=username:password
export BUNDLE_GITHUB__COM=<personal-oauth-token>:x-oauth-basic
```

**Option 2: bundle config**

```bash
bundle config https://github.com/bundler/bundler.git username:password
```

**Option 3: ~/.git-credentials**

```bash
echo 'https://user:pass@example.com' >> ~/.git-credentials
```

**References**
https://github.com/rubygems/bundler/pull/3898
https://git-scm.com/docs/git-credential-store
