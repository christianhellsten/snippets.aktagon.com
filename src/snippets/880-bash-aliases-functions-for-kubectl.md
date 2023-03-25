---
id: '880'
title: Bash aliases / functions for kubectl
languages:
- bash
tags:
---
Put the following functions in, for example, ~/.bash_aliases:

```bash
# Open a bash shell in the pod
function kshell() { kubectl exec -it "$1" -- /bin/bash ;}
# List pods
function kpods() { kubectl get po -n default -o wide ;}
function klogs() { kubectl logs -f "$1" ;}
function ktail() { kubectl logs --tail=100 -f "$1" ;}
# Restarts a pod
function krestart() { kubectl rollout restart "deployment/$1" ;}
# Stops a pod by scaling it to zero
function kstop() { kubectl scale --replicas=0 "deployment/$1" ;}
function kdesc() { kubectl describe pod $1 ;}
function ksecret() { kubectl get secret $1 -o jsonpath="{.data.$2}" | base64 --decode ;}
function ksecrets() { kubectl get secret/$1 -o yaml ;}
```

Your RSI symptoms and cognitive dissonance will disappear in about 6 months.
