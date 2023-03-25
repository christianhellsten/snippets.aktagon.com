---
id: '871'
title: How to debug CrashLoopBackOff
languages:
- bash
- yaml
tags:
---
One day, you see CrashLoopBackOff in the kubectl output:

```bash
$ kubectl get pod
NAME                               READY   STATUS             RESTARTS   AGE
app-548c9ddc46-z2fng               0/1     CrashLoopBackOff   79         6h26m
```

You already know that executing bash in the container is not possible because the container has crashed:

```bash
$ kubectl exec -ti app-548c9ddc46-z2fng bash
error: unable to upgrade connection: container not found ("app")
```

## Option 1: Analyze the container logs

You can view the container's logs with **kubectl logs**:

```bash
$ kubectl logs -f app-548c9ddc46-z2fng
```

## Option 2: Modify Dockerfile's CMD

Modifying the Dockerfile's 'CMD' is not needed, as it can be done indirectly through the Pod's YAML configuration file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: app
spec:
  containers:
    - name: app
      image: company/app
      # DEBUG env variables
      command: [ "/bin/sh", "-c", "env" ]
```

The modified command will print the environment variables to the logs:

```yaml
command: [ "/bin/sh", "-c", "env" ]
```

To view the output run:

```bash
$ kubectl logs -f app-548c9ddc46-z2fng
```

## Option 3: Start a shell and sleep (CMD)

Sleeping usually helps, and this can be done by modifying the container's command:

```bash
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: xxx-service
spec:
  replicas: 1
  template:
    ...
    spec:
      containers:
      - image: yyy/xxx:1.0.0
        name: xxx-service
        ...
        command:
          - "sh"
          - "-c"
          - "sleep 10000"
```

The container will start and run "sleep 10000" in a shell, giving you exactly 10000 seconds to debug the issue by connecting to the "sleeping" container:

```bash
$ kubectl exec -ti app-548c9ddc46-z2fng bash
```
