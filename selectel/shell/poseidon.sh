#!/bin/bash

docker run --name nginx -p 80:80 -v /etc/nginx/sites-enabled:/etc/nginx/sites-enabled -m 2048M --cpuset-cpus="2-3" --restart=on-failure:3 -d nginx

docker run --name ftp -m 1024M --cpuset-cpus="4" --restart=on-failure:3 -p 21:21 -p 30000-30009:30000-30009 -d stilliard/pure-ftpd:latest

OVPN_DATA="ovpn-data"
docker run --name $OVPN_DATA -v /etc/openvpn busybox
docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -u udp://poseidon
docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki
docker run --volumes-from $OVPN_DATA -d -m 2048M --cpuset-cpus="1" --restart=on-failure:3 -p 1194:1194/udp --privileged kylemanna/openvpn
#docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn easyrsa build-client-full {hera,zeus,jupiter,ceres,kuzmovych,proskudin,suzdaltsev,volkov} nopass

