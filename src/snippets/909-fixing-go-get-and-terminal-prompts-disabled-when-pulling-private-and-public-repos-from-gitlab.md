---
id: '909'
title: Fixing "go get" and "terminal prompts disabled" when pulling private and public
  repos from gitlab
languages:
- bash
tags:
---
This frustrating error when running go get can be fixed by following these instructions:

```bash
go: downloading gitlab.com/christianhellsten/go-xxxx v0.0.0-20200816045911-18af1d03e51a
cmd/go-xxx/main.go:4:2: gitlab.com/christianhellsten/go-xxx@v0.0.0-20200816045911-18af1d03e51a: verifying module: gitlab.com/christianhellsten/go-xxx@v0.0.0-20200816045911-18af1d03e51a: reading https://sum.golang.org/lookup/gitlab.com/christianhellsten/go-xxx@v0.0.0-20200816045911-18af1d03e51a: 410 Gone
	server response:
	not found: gitlab.com/christianhellsten/go-xxx@v0.0.0-20200816045911-18af1d03e51a: invalid version: git fetch -f origin refs/heads/*:refs/heads/* refs/tags/*:refs/tags/* in /tmp/gopath/pkg/mod/cache/vcs/1dd4008ad7804a122a243831f561ea1000480bb532c0388829d0f37bc7349fef: exit status 128:
		fatal: could not read Username for 'https://gitlab.com': terminal prompts disabled
```

Make sure you have the latest go and git versions.

Then run the following commands:

```bash
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
git config --global url.ssh://git@gitlab.com/.insteadOf https://gitlab.com/
go env -w GOPRIVATE="gitlab.com/christianhellsten,bitbucket.org/christianhellsten,github.com/christianhellsten"
```

Specify the Gitlab token in ~/.git-credentials or ~/.netrc.

Now you can enjoy simple things such as pulling your repos from the internet, but you need to remember to set GIT_TERMINAL_PROMPT too:

```bash
GIT_TERMINAL_PROMPT=1 go get
```

References:

- https://stackoverflow.com/questions/61152197/invalid-version-and-https-references-when-importing-private-repo-in-golang

- https://stackoverflow.com/questions/60579900/how-to-fix-invalid-version-and-could-not-read-username-in-go-get-of-a-priv
