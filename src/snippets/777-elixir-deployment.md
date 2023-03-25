---
id: '777'
title: Elixir Deployment
languages:
- bash
- elixir
tags:
---
## Setup

Development environment:

1. Sign up for a Gitlab account, or use your favorite git server
2. Create a (private) repository
3. Create a deploy key that allows read-only access to your private repository (optional, if public)
4. Commit code to the repository

## Pre-requisites

You will need Elixir:

```bash
$ sudo apt-get install elixir
```

## Code

Add distillery to the list of dependencies:

```elixir
def deps do
   ...
   {:distillery, "~> 0.9.9"},
   ...
 end
```
 
Run mix release.init and follow the instructions:

```bash
$ mix release.init

An example config file has been placed in rel/config.exs, review it,
make edits as needed/desired, and then run `mix release` to build the release
```

Next, run *mix release*:
```bash
You can run it in one of the following ways:
  Interactive: rel/xxx/bin/xxx console
  Foreground: rel/xxx/bin/xxx foreground
  Daemon: rel/xxx/bin/xxx start
```


## Deployment

Production environment:

1. Clone project

```bash
$ cd /var/www
$ git clone git@gitlab.com:christianhellsten/aktagon-snippets.git
```

2. Create a release

```bash
$ MIX_ENV=prod mix do deps.get, clean, compile
$ MIX_ENV=prod mix release --verbosity=verbose
```

3. Create a monit start script

```
#
# Run "ps -ef | grep beam, if you get status "Does not exist" from "monit status"
#
check process snippets MATCHING "rel/snippets"
    start program = "/bin/su - deploy -c '/var/www/aktagon-snippets/rel/snippets/bin/snippets start'"
    stop program = "/bin/su - deploy -c '/var/www/aktagon-snippets/rel/snippets/bin/snippets stop'"
```

4. Start server

```bash
$ sudo monit start snippets
```

## Deploying a new version

First increment the version number. Then perform the hot upgrade:

```bash
$ git pull
$ export MIX_ENV=prod
$ mix do compile
$ mix release --upgrade 

$ rel/snippets/bin/snippets upgrade "0.0.2"
```

## Rolling back to a previous version

How to perform hot downgrades:

```bash
$ rel/snippets/bin/snippets downgrade "0.0.1"
```

See
https://hexdocs.pm/distillery/getting-started.html

## Phoenix

See [Using Distillery With Phoenix](https://hexdocs.pm/distillery/use-with-phoenix.html).

## Alternatives

- https://github.com/boldpoker/edeliver
