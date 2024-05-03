# FixSplitter

![Arch](./img.jpg?raw=true "Arch")

# why
* We need to separate the inbound and outbound streams into two different paths (and probably two different servers in the client side) which will ensure better performance over the same allowed bandwidth.
* Ensure that messages sent to the exchange fix GW will be sent in an acceptable rate.

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

* git clone https://github.com/mrefky/fixsplitter.git
* Edit the file named default.yaml replaciing 192.168.169.7 with the echange fix server IP.
* Edit the file named default.yaml replacing 192.168.169.62 with an IP in your nework subnet that the client first connection will connect to.
* Edit the file named default.yaml replacing 192.168.169.52 with an IP in your nework subnet that the client second connection will connect to.
* Edit the file named default.yaml replacing 01001 with your firm code.
* Edit the file named default.yaml replacing 31001 with your exchange fix port.
* cd fixsplitter
* chmod a+x *.sh
* chmod a+x */*.sh
* ./re_install.sh
* ./Scripts/install_docker.sh
* ./Scripts/install_k9s.sh
* ./build.sh
* k9s

![Arch](./img2.jpg?raw=true "Arch")