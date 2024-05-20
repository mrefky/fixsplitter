# FixSplitter

![Arch](./img.jpg?raw=true "Arch")

# why
* We need to separate the inbound and outbound streams into two different paths (and probably two different servers in the client side) which will ensure better performance over the same allowed bandwidth.
* Ensure that messages sent to the exchange fix GW will be sent in an acceptable rate {and can be further reduced if needed as explained below}.

# How

The client will have to build two fix client applications : 
* The first “Client first FIX connection” will send application massages to the excahnge and will not receive any replies (except if the message is a malformed fix messages and in that case the client will receive a reject message). 
* The second one “Client second FIX connection” will receive the replies from the exchange.
# Gateways
This repository will install the following gateways 
*	“Inbound GW” that will receive application messages from the client and send these messages to Kafka inbound topic.
*	“DGW3” that will read messages stored in “Kafka” inbound topic in a timely FIFO manner and send it to the exchange Fix gateway and will receive replies and send it to the Outbound GW 
*	Outbound GW which will stores these messages to the outbound topic.
*	DGW2 that will read messages from Kafka outbound Store topic and send it to client second fix connection.


# To install do the following steps

* sudo apt update && sudo apt upgrade -y
* apt install git -y
* apt install curl -y
* git clone https://github.com/mrefky/fixsplitter.git
* cd fixsplitter

Edit the file named default.yaml

* Replaciing 192.168.169.7 with the exchange fix server IP.
* Replacing 192.168.169.62 with an IP in your nework subnet that the client first connection will connect to.
* Replacing 192.168.169.52 with an IP in your network subnet that the client second connection will connect to.
* Replacing 01001 with your firm code.
* Replacing 31001 with your exchange fix port.
* Edit the file named re_install.sh replacing the below line with valid IP range in your system:

sudo microk8s.enable metallb 192.168.169.50-192.168.169.99 

Continue with the following steps:

* chmod a+x *.sh
* chmod a+x  ./Scripts/*.sh
* ./re_install.sh

* ./Scripts/install_docker.sh
* ./Scripts/install_k9s.sh
* ./Scripts/get_helm.sh
* ./Scripts/repo.sh
* ./ini.sh
* ./build.sh


# Deployments

![Arch](./deploy.jpg?raw=true "Arch")

# Statefullsets

![Arch](./Stat1.jpg?raw=true "Arch")

# Pods

![Arch](./img2.jpg?raw=true "Arch")

# Services

![Arch](./svc.jpg?raw=true "Arch")

# Config Maps

![Arch](./cm.jpg?raw=true "Arch")


# Test applications

We will publish two c# test applications

* Fixman https://github.com/mrefky/Fixman.git
* client-2 https://github.com/mrefky/client-2.git 

# Connection Parameters

# Client first connection

* IP=192.168.169.62
* Port=5001
* TargetCompID=CASE
* SenderCompID=01001

# Client second connection

* IP=192.168.169.52
* Port=31001
* TargetCompID=CASE2
* SenderCompID=01001

# kafka-ui

http://192.168.169.50:8080


# How to reduce traffic rate
* You dont need to reduce it since

    - The "inbound topic" will not have any issues event if the messages rate is extermely high 
    
    - Reading messages from the inboundgw and sending these messages to the exchange fix gateway will be limitted by the deplay introduced by the application 


 However if needed you can:
  
 * Either use the “inboundGW” code to reject messages that exceeds acceptable rate (code is implemented however the maximum rate is opened)
 *	Or delay rate of messages sent from GW3 to the exchange by adding an acceptable delays if needed.

