# Kills any running canary pods. Does nothing 
# if canary-test-start.sh hasn’t been run first.


#!/bin/bash

kubectl delete rc -l name=kube-capabilities-tomcat-canary