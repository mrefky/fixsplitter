microk8s kubectl delete -f default.yaml
microk8s kubectl delete sts,deploy,pvc,cm,pvc,svc,events,po --all
microk8s.kubectl wait pod --all --for=condition=Ready  --all-namespaces
microk8s kubectl create -f default.yaml
microk8s.kubectl wait pod --all --for=condition=Ready  --all-namespaces
./delete_kafka.sh
./install_kafka.sh
microk8s.kubectl wait pod --all --for=condition=Ready  --all-namespaces
./reset0.sh

k9s

