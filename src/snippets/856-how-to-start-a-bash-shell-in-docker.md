---
id: '856'
title: How to start a bash shell in Docker
languages:
- bash
tags:
---
To start a bash shell in an already running container:

```bash
docker exec -it <container id/name> bash
```

To start a bash shell using an image of a container that is not running:

```bash
docker run -i -t --entrypoint /bin/bash <image id>
```

