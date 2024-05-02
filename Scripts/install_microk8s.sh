sudo snap install microk8s --classic
sudo usermod -a -G microk8s mrefky
sudo mkdir -p ~/.kube
sudo chown -f -R mrefky ~/.kube
