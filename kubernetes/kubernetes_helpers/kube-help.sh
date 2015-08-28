echo -e "\033[1;32m"
echo -e "kubectl get [nodes | pods | services | replication controllers | namespaces | secrets | endpoints]\033[0m"
echo Lists all nodes, pods, services, or replication controllers, respectively.

echo -e "\033[1;32m"
echo -e "kubectl describe pods/<pod_name>\033[0m"
echo Lists basic information and events for a given pod.

echo -e "\033[1;32m"
echo -e "kubectl logs <pod_name>\033[0m"
echo Lists most recent logs for a given pod. Often enough for basic debugging.

echo -e "\033[1;32m"
echo -e "kubectl config view\033[0m"
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

echo -e "\033[1;32m"
echo -e "vagrant ssh minion-1 \t\t\t\t\t\t# SSH into the node you are operating on."
echo -e "sudo su \t\t\t\t\t\t\t# Operate as root"
echo -e "docker ps \t\t\t\t\t\t\t# Find and grab the container id (:CONTAINER_ID) for your image."
echo -e "docker inspect --format {{.State.Pid}} :CONTAINER_ID \t\t# Copy process id (:PROC_ID). Note these are dash-dash."
echo -e "nsenter --target :PROC_ID --mount --uts --ipc --net --pid \t# Voila. Note these are dash-dash."
echo -e "\033[0m"
echo 'SSH' into a container.

echo
echo
