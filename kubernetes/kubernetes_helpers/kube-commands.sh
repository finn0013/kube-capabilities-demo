echo -e "\033[1;32m"
echo -e "kubectl get [nodes | pods | services | replication controllers]\033[0m"
echo Lists all nodes, pods, services, or replication controllers, respectively.

echo -e "\033[1;32m"
echo -e "kubectl describe pods/<pod_name>\033[0m"
echo Lists basic information and events for a given pod.

echo -e "\033[1;32m"
echo -e "kubectl logs <pod_name>\033[0m"
echo Lists most recent logs for a given pod. Often enough for basic debugging.

echo -e "\033[1;32m"
echo -e "kubectl get endpoints <pod_name>\033[0m"
echo "List the IP address endpoints for the pod(s)."

echo
echo