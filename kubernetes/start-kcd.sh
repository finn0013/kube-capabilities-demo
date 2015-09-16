kubectl create -f ./kube-capabilities-demo-secret.yaml

kubectl create -f ./kube-capabilities-demo-svc.yaml
kubectl create -f ./kube-capabilities-demo-rc.yaml

kubectl create -f ./kube-capabilities-tomcat-rc.yaml