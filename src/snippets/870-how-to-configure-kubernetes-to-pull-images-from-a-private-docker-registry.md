---
id: '870'
title: How to configure Kubernetes to pull images from a private Docker registry
languages:
- bash
- yml
tags:
---
How to configure Kubernetes to pull images from a private Docker registry:

- First configure Docker by following the steps outlined here:

https://snippets.aktagon.com/snippets/869-configure-docker-to-use-a-private-container-registry-using-a-self-signed-certificate

- Verify that the Docker configuration contains the authentication information

```bash
sudo cat ~/.docker/config.json
{
	"auths": {
		"<registry-server>": {
			"auth": "<hash>"
		}
	},
	"HttpHeaders": {
		"User-Agent": "Docker-Client/18.09.4 (linux)"
	}
}
```

- Base64 encode the config.json file

```yml
cat ~/.docker/config.json | base64 -w0 > config.base64.json
```

- Create secret.yml and add the contents of config.base64.json to dockerconfigjson

```yml
apiVersion: v1
kind: Secret
metadata:
 name: registrypullsecret
data:
 .dockerconfigjson: <config.base64.json>
type: kubernetes.io/dockerconfigjson
```

- Import the secret into Kubernetes

```bash
kubectl create -f secret.yml && kubectl get secrets
```

- Test that the secret was imported into Kubernetes

```bash
kubectl get secrets
```
