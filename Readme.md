# FixSplitter

![Alt text](./img.jpg?raw=true "Title")

*	The client will have to build two fix client applications : 
**	The first “Client first FIX connection” will send application massages to EGX and will not receive any replies (except if the message is a malformed fix messages and in that case the client will receive a reject message). 
b.	The second one “Client FIX second FIX connection” will receive the replies from EGX.
2.	EGX will build four fix order manipulation gateways: 
a.	“Inbound GW” that will receive application messages from the client and send these messages to Kafka inbound topic.
b.	“DGW3” that will read messages stored in “Kafka” inbound topic in a timely FIFO manner and send it to EGX Fix gateway and will receive replies and send it to the Outbound GW 
c.	Outbound GW which will stores these messages to the outbound topic.
d.	DGW2 that will read messages from Kafka outbound Store topic and send it to client second fix connection.


To install do the following steps

* git clone https://github.com/mrefky/fixsplitter.git
* cd fixsplitter
* chmod a+x *.sh
* chmod a+x */*.sh
* ./re_install.sh
* ./Scripts/install_docker.sh
* ./Scripts/install_k9s.sh
* ./build.sh
* k9s