echo -e "\033[1;32m"
echo -e "kubectl get [nodes | pods | services | replication controllers | namespaces | secrets | endpoints <pod_name>]\033[0m"
echo Lists all nodes, pods, services, or replication controllers, respectively.

echo -e "\033[1;32m"
echo -e "kubectl describe pods/<pod_name>\033[0m"
echo Lists basic information and events for a given pod.

echo -e "\033[1;32m"
echo -e "kubectl logs <pod_name>\033[0m"
echo Lists most recent logs for a given pod. Often enough for basic debugging.

echo -e "\033[1;32m"
echo -e "kubectl get config view\033[0m"
echo "List the IP address endpoints for the pod(s)."

echo -e "\033[1;32m"
echo -e "kubectl cluster-info\033[0m"
echo "List the IP address endpoints for the pod(s)."

echo -e "\033[1;32m"
echo -e "kubectl create -f [file] --validate\033[0m"
echo Validate the correctness of a configuration file.

echo -e "\033[1;32m"
echo -e kubectl create -f cluster/addons/kube-ui/kube-ui-rc.yaml --namespace=kube-system
echo -e "kubectl create -f cluster/addons/kube-ui/kube-ui-svc.yaml --namespace=kube-system\033[0m"
echo Start Kubernetes UI. Get the stood up Url with ‘kubectl cluster-info’

echo
echo