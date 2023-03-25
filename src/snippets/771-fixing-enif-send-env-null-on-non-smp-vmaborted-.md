---
id: '771'
title: 'Fixing "enif_send: env==NULL on non-SMP VMAborted"'
languages:
- bash
- erlang
tags:
---
I received the following error while testing an Elixir application on a Debian VPS having only 1 CPU:
```erlang
enif_send: env==NULL on non-SMP VMAborted
```

Usually this means your Erlang VM was compiled without SMP support.

In my case, the issue was caused by the VPS having only 1 CPU, as explained in the documentation for *erl*:
```
$ man erl
...
-smp [enable|auto|disable]

	-smp enable and -smp starts the Erlang runtime system with SMP support enabled. This may fail if no runtime system with SMP support is available.
	-smp auto starts the Erlang runtime system with SMP support enabled if it is available and more than one logical processor are detected.
	-smp disable starts a runtime system without SMP support.
...
```

Also see http://erlang.org/doc/man/erl_nif.html#enif_send

I fixed the issue by enabling SMP-mode using the *--erl* switch:
```bash
MIX_ENV=prod iex --erl "-smp enable" -S mix
```

Next, I tried to fix the issue by using the ELIXIR_ERL_OPTIONS environment variable:
```
ELIXIR_ERL_OPTIONS="-smp enable"
```

This works fine when running the application with mix. However, with exrm this option does not work.

## exrm

If you're deploying your app to production using exrm then you have to add the switch to *running-config/vm.args* after each deploy, or in *rel/vm.args* for a permanent solution:

```
# Enable SMP on 1 CPU machines
-smp enable
```

See this issue on Github for more information about why you can't use *ELIXIR_ERL_OPTIONS="-smp enable"*:
https://github.com/bitwalker/exrm/issues/90

Also see the exrm documentation for more details:
https://exrm.readme.io/docs/release-configuration
