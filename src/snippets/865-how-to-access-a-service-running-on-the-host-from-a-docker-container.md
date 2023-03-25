---
id: '865'
title: How to access a service running on the host from a docker container
languages:
- bash
tags:
---
How to access a service running on the host from a docker container? Easy...

First, RTFM:

https://docs.docker.com/docker-for-mac/networking/

https://docs.docker.com/docker-for-windows/networking/

## Linux (bridge network)

1. Create a custom bridge network

You can also use the default bridge network.

2. Make the docker container use the custom network

See network configuration in the docker compose example below.

3. On the host make the service listen to the hosts IP address on the custom network

For example, change listen_addresses in postgresql.conf for PostgreSQL.

Example docker-compose.yml:

```bash
version: "3.8"
services:
  "mycontainer":
    image: registry.gitlab.com/xxx/mycontainer:v1
    networks:
      - mynetwork
    env_file: ./mycontainer.env
networks:
  mynetwork:
    ipam:
      config:
        - subnet: 172.25.0.0/16
```

The docker container will be assigned an IP from the 172.25.0.0/16 subnet.

Make sure the service is listening to the host's IP address on the network which should be 172.25.0.1.

Remember to allow the traffic in the firewall. See UFW example below:

```bash
# Check where the connection is coming from:
sudo dmesg
# Unblock the connections by source IP
sudo ufw allow in from "172.25.0.5" to 172.17.0.1 port 5432
# Or, unblock the connections by network name
sudo ufw allow in on <name of network> to 172.17.0.1 port 5432
```

## Mac

Host networking is not supported by MacOS. You can use an IP address alias instead or one of the host's IP addresses.

**Option 1: Using an IP address alias**

We can use an IP address that does not resolve inside the container to access the host. Unresolved IP addresses are routed to the host for resolving.

First, create an alias:

```bash
sudo ifconfig lo0 10.0.0.13
```

Make Postgres listen to the address in postgresql.conf:

```
listen_addresses = 'localhost,10.0.0.13'
```

Allow connections in pg_hba.conf:

```
host    all             all             10.0.0.13/32            trust
```

Restart PostgreSQL.

**Option 2: Using an existing host IP address**

Same as above except you don't have to create an alias as the IP address already exists.

Run ifconfig -a on the host to list all IP addresses. Select one and see the instructions above.

## Bad ideas

There are many other ways of achieving this, which are more or less bad ideas...

- Option 1: docker hostnames

This option is mostly useful in development environments:

```bash
# Mac
ping docker.for.mac.localhost

# Windows
ping docker.for.win.localhost

# Linux: use the Docker IP or the hosts external IP, see:
# https://github.com/docker/for-linux/issues/264#issuecomment-385698947
```

- Option 2: host networking

This option is not a good idea if you plan on hosting many projects on the same server.

Note that it's not possible to use host networking on Mac or Windows, only Linux:

> The host networking driver only works on Linux hosts, and is not supported on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server. 


See:
- https://docs.docker.com/docker-for-mac/networking/#httphttps-proxy-support
- https://stackoverflow.com/questions/28056522/access-host-database-from-a-docker-container
- https://docs.docker.com/network/network-tutorial-host/
- https://stackoverflow.com/questions/17394241/my-firewall-is-blocking-network-connections-from-the-docker-container-to-outside#comment85252538_27931534
