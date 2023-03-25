---
id: '848'
title: How to deploy an app on a specific node/server in a kubernetes cluster using
  labels
languages:
- yaml
tags:
---
This is an example of how to deploy an app on a specific node/server in a kubernetes cluster using labels:

```yaml
# # Label one node in k8s cluster
#
# $ kubectl label nodes 48.234.16.45 country=finland name=node1
#
# # Deploy 1 nginx pod in k8s cluster on node1 in Finland
#
# $ kubectl apply -f nginx.yml
#
# # View deployment
#
# $ kubectl describe deployment nginx-app
#
# # View pods
#
# $ kubectl get pods -l app=nginx
#
# # Find port the service is listening on
#
# $ kubectl describe service nginx-app | grep NodePort
# > NodePort:                 http   31796/TCP
# > NodePort:                 https  31797/TCP
#
# # Find the node the pod is deployed to
#
# $ kubectl describe pods nginx-app | grep Node
# > Node:           48.234.16.45/10.0.0.2
#
# # Access deployment using node ip and port
#
# http://<node ip>:<node port>
#
# # Export service to YAML
#
# $ kubectl get service nginx-app -o yaml --export
#
# # Delete
#
# $ kubectl delete deployments,services -l country=finland
#
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
  labels:
    run: nginx-app
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 1 # tells deployment to run 1 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.13.12
        ports:
        - containerPort: 80
        - containerPort: 443
      nodeSelector:
        country: finland
        server: node1
---
#
# Expose deployment on <node ip>:<node port>. Node and a random port is assigned by k8s.
#
apiVersion: v1
kind: Service
metadata:
  labels:
    run: nginx-app
  name: nginx-app
spec:
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
  - name: https
    port: 443
    protocol: TCP
    targetPort: 443
  selector:
    app: nginx
  type: NodePort
```
