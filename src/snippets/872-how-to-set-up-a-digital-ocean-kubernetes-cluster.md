---
id: '872'
title: How to set up a Digital Ocean Kubernetes cluster
languages:
- bash
- yaml
tags:
---
How to set up a Digital Ocean Kubernetes cluster (Q1 2019).

## Introduction

Overview of how a request gets from a browser to a Docker container managed by Kubernetes:

```bash
Internet[Browser => DigitalOcean LoadBalancer] => Kubernetes[Ingress => Service => Deployment => Pod] => Docker[Container]
```

- https://kubernetes.io/docs/concepts/services-networking/ingress/
- https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/
- https://kubernetes.io/docs/concepts/services-networking/service/
- https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
- https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
- https://kubernetes.io/docs/concepts/workloads/pods/pod/

## Prerequisites

- Install kubectl

```bash
$ brew install kubectl
```

1. Create cluster in DigitalOcean dashboard

Download the cluster configuration (YAML file) and put it in the ~/.kube folder.

3. Set KUBECONFIG environment variable

```bash
$ export KUBECONFIG=/Users/christian/.kube/staging-kubeconfig.yaml
$ kubectl config current-context
$ kubectl get nodes
NAME               STATUS   ROLES    AGE   VERSION
xxx-staging-qv72   Ready    <none>   70m   v1.14.1
xxx-staging-qv7p   Ready    <none>   71m   v1.14.1
xxx-staging-qv7s   Ready    <none>   71m   v1.14.1
```

4. Install ingress controller

```bash
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/cloud-generic.yaml
```

Get the EXTERNAL-IP of the load balancer:

```bash
$ kubectl get services --namespace=ingress-nginx
```

5. Create ingress resource

ingress.yaml:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: app-ingress
  annotations:
    ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - http:
      paths:
        - path: /
          backend:
            serviceName: app-service
            servicePort: 80
```

```bash
$ kubectl apply -f ingress.yml
```

6. Create deployment

deployment.yaml:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-service
spec:
  ports:
  - port: 80
    targetPort: 5678
  selector:
    app: app
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app
spec:
  selector:
    matchLabels:
      app: app
  replicas: 1
  template:
    metadata:
      labels:
        app: app
    spec:
      containers:
      - name: app
        image: hashicorp/http-echo
        args:
        - "-text=Hello. This is your Digital Ocean k8s cluster."
        ports:
        - containerPort: 5678
```

```bash
$ kubectl apply -f deployment.yml
```

7. Curl your app

```bash
curl https://<EXTERNAL-IP> --insecure
```

## References

- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes?comment=76348#step-2-%E2%80%94-setting-up-the-kubernetes-nginx-ingress-controller

