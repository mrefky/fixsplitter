sudo microk8s.start
#microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
echo "Checking status"
sudo microk8s status --wait-ready
#sudo microk8s dashboard-proxy --node-ip
