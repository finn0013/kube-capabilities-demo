# Runs a green-blue (reversing the blue-green) server deployment. 
# Note that this does NOT do anything to validate sessions, users,
# shut down connections gracefully, etc.
#
# For this script to work the cluster must be running 'green' labeled
# pods.


#!/bin/bash

kubectl rolling-update kube-capabilities-tomcat-green -f kube-capabilities-tomcat-rc.yaml