#!/bin/bash
username=`hostname`
sudo docker run -it --cap-add=NET_ADMIN --device /dev/net/tun --restart=on-failure:3 -m 512M --cpuset-cpus="0" --name vpn -v /etc/vpn:/vpn -d dperson/openvpn-client -v "poseidon;$username"
