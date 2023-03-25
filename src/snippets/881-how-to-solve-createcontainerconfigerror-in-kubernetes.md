---
id: '881'
title: How to solve "CreateContainerConfigError" in Kubernetes
languages:
- bash
tags:
---
To solve CreateContainerConfigError try this command:

```bash
$ kubectl describe pod xxx-86cbd7555b-2zrs2
...
...
  Warning  Failed     75s (x8 over 2m50s)  kubelet, k8s-node1  Error: couldn't find key XXX in ConfigMap default/xxx
...
```
