# FixSplitter

![Arch](./img.jpg?raw=true "Arch")

# why
* We need to separate the inbound and outbound streams into two different paths (and probably two different servers in the client side) which will ensure better performance over the same allowed bandwidth.
* Ensure that messages sent to the exchange fix GW will be sent in an acceptable rate.

# How

The client will have to build two fix client applications : 
* The first “Client first FIX connection” will send application massages to the excahnge and will not receive any replies (except if the message is a malformed fix messages and in that case the client will receive a reject message). 
* The second one “Client second FIX connection” will receive the replies from the exchange.
# Below are the gateways deployed
*	“Inbound GW” that will receive application messages from the client and send these messages to Kafka inbound topic.
*	“DGW3” that will read messages stored in “Kafka” inbound topic in a timely FIFO manner and send it to the exchange Fix gateway and will receive replies and send it to the Outbound GW 
*	Outbound GW which will stores these messages to the outbound topic.
*	DGW2 that will read messages from Kafka outbound Store topic and send it to client second fix connection.


# To install do the following steps

* git clone https://github.com/mrefky/fixsplitter.git
* cd fixsplitter
* chmod a+x *.sh
* chmod a+x */*.sh
* ./re_install.sh
* ./Scripts/install_docker.sh
* ./Scripts/install_k9s.sh
* ./build.sh
* k9s