sudo snap remove multipass --purge
sudo rm -rf ~/snap/multipass
sudo snap remove lxd --purge
sudo rm -rf ~/snap/lxd
sudo snap install multipass --classic
sudo snap install lxd --classic
sudo lxd init
sudo multipass set local.driver=lxd
sudo multipass set local.passphrase=foo
sudo multipass authenticate foo
sudo snap connect multipass:lxd lxd
sleep 10
multipass networks
multipass launch --name vm01 --cpus 2 --memory 8G --disk 20G --network eno1
multipass launch --name vm02 --cpus 2 --memory 8G --disk 20G --network eno1
multipass launch --name vm03 --cpus 2 --memory 8G --disk 20G --network eno1


multipass list
