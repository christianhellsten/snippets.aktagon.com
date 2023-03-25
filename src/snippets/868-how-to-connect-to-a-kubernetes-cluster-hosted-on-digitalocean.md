---
id: '868'
title: How to connect to a Kubernetes cluster hosted on DigitalOcean
languages:
- bash
tags:
---
Tested April, 2019.

1. Download the Kubernetes configuration from the DigitalOcean dashboard

2. Move the Kubernetes configuration file to ~/.kube folder

```bash
$ mkdir $HOME/.kube/projectx/
$ mv ~/Downloads/projectx-staging-kubeconfig.yaml $HOME/.kube/projectx/staging-kubeconfig.yaml
```

4. List all contexts in the KUBECONFIG variable

```bash
$ export KUBECONFIG=$HOME/.kube/projectx/staging-kubeconfig.yaml:$HOME/.kube/projectx/production-kubeconfig.yaml
```

3. Install kubectl

```bash
$ brew install kubectl
```

4. List context and nodes

```bash
$ kubectl config get-contexts
$ kubectl get nodes
$ kubectl config use-context
```
