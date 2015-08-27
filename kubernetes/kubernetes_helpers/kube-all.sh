. set_kube_env.sh
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

echo
echo