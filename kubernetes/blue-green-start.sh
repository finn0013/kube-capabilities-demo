# Runs a blue-green server deployment. Note that this does NOT
# do anything to validate sessions, users, shut down connections
# gracefully, etc.
#
# For this script to work the cluster must be running 'blue' labeled
# pods (default after start-kcd.sh).


#!/bin/bash

kubectl rolling-update kube-capabilities-tomcat -f kube-capabilities-tomcat-green-rc.yaml