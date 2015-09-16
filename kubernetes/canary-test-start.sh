#!/bin/bash

rm -f canary-rc.yaml

if [ -n "$1" ]; then
    CANARIES=$1
else
    CANARIES=2
fi

echo Creating $CANARIES canary instances.

sed "s/CANARY_COUNT/${CANARIES}/g" kube-capabilities-canary-rc.yaml > canary-rc.yaml

kubectl create -f ./canary-rc.yaml

rm -f canary-rc.yaml