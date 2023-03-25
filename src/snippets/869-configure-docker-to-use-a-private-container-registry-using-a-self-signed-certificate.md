---
id: '869'
title: Configure Docker to use a private container registry using a self-signed certificate
languages:
- bash
tags:
---
How to configure Docker to use a private container registry using a self-signed certificate.

Tested on Docker version 18.09.4, build d14af54.

- Copy self-signed certificate from the registry server to the docker server

On your laptop:

```bash
$ scp christian@registry-server://etc/ssl/certs/selfsigned.crt christian@docker-server://etc/ssl/certs/private-docker-registry.crt
```

- Restart docker daemon

On the docker server:

```bash
$ sudo service docker restart
```

- Login to the registry from the docker server

On the docker server:

```bash
sudo docker login -u christian registry-server
> WARNING! Your password will be stored unencrypted in /home/christian/.docker/config.json.
```
