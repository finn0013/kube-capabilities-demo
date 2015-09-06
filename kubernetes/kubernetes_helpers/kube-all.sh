. set-kube-env.sh
echo

echo -e "\033[1;32m"
echo NODES:
echo -e "========================\033[0m"
kubectl get nodes
echo

echo -e "\033[1;32m"
echo PODS:
echo -e "========================\033[0m"
kubectl get pods
echo

echo -e "\033[1;32m"
echo SERVICES:
echo -e "========================\033[0m"
kubectl get services
echo

echo -e "\033[1;32m"
echo REPLICATION CONTROLLERS:
echo -e "========================\033[0m"
kubectl get replicationcontrollers
echo

echo -e "\033[1;32m"
echo SECRETS:
echo -e "========================\033[0m"
kubectl get secrets
echo

echo -e "\033[1;32m"
echo NAMESPACES:
echo -e "========================\033[0m"
kubectl get namespaces
echo

echo -e "\033[1;32m"
echo ENDPOINTS:
echo -e "========================\033[0m"
kubectl get endpoints
echo

echo
echo