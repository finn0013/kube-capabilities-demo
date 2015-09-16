# Stops the cluster. Don’t worry about errors 
# here – it tries to stop everything that could 
# possibly be running.


#!/bin/bash

kubectl delete -f ./kube-capabilities-demo-rc.yaml
kubectl delete -f ./kube-capabilities-demo-svc.yaml

kubectl delete -f ./kube-capabilities-demo-secret.yaml

kubectl delete rc -l name=kube-capabilities-tomcat-canary

kubectl delete -f ./kube-capabilities-tomcat-rc.yaml

kubectl delete -f ./kube-capabilities-tomcat-green-rc.yaml