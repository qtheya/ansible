#!/bin/bash

#docker run -d -p 3000:3000 -m 4096M --cpuset-cpus="29-31" --name redmine -v /var/lib/redmine:/usr/src/redmine/files  redmine

docker run --detach -m 6G --cpuset-cpus="25-28" --restart=on-failure:3   \
    --publish 8143:443 --publish 8180:80 --publish 2222:22 \
    --name gitlab \
    --restart always \
    --volume /var/lib/gitlab/config:/etc/gitlab:Z \
    --volume /var/lib/gitlab/logs:/var/log/gitlab:Z \
    --volume /var/lib/gitlab/data:/var/opt/gitlab:Z \
    --volume /var/lib/gitlab/logs/reconfigure:/var/log/gitlab/reconfigure:Z \
    gitlab/gitlab-ce:latest

#docker run --name mariadb -v /var/lib/mysql:/var/lib/mysql:Z --cpuset-cpus="28-30" --restart=on-failure:3 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=olabs2016redmine -d mariadb:latest 

docker run -d --name spark -m 40G --cpuset-cpus="8-19" --restart=on-failure:3 spark/scala

docker run -d -m 32G --cpuset-cpus="0-12" -p 7000-7001:7000-7001 -p 7199:7199 -p 9042:9042 -p 9160:9160 -v /etc/cassandra0/cassandra.yaml:/etc/cassandra/cassandra.yaml \
   -v /var/lib/cassandra0/data:/var/lib/cassandra/data:Z \
   -v /var/lib/cassandra0/commitlog:/var/lib/cassandra/commitog:Z \
   --restart=on-failure:3 \
   --name cassandra0 cassandra/local

docker run -d -m 32G --cpuset-cpus="13-25" -p 17000-17001:7000-7001 -p 17199:7199 -p 19042:9042 -p 19160:9160 -v /etc/cassandra1/cassandra.yaml:/etc/cassandra/cassandra.yaml \
   -v /var/lib/cassandra1/data:/var/lib/cassandra/data:Z \
   -v /var/lib/cassandra1/commitlog:/var/lib/cassandra/commitog:Z \
   --restart=on-failure:3 \
   --name cassandra1 cassandra/local


firewall-cmd --zone=public --add-port=17000-17001/tcp --permanent
firewall-cmd --zone=public --add-port=19042/tcp --permanent
firewall-cmd --zone=public --add-port=19160/tcp --permanent
firewall-cmd --zone=public --add-port=17199/tcp --permanent
firewall-cmd --zone=public --add-port=7000-7001/tcp --permanent
firewall-cmd --zone=public --add-port=9042/tcp --permanent
firewall-cmd --zone=public --add-port=9160/tcp --permanent
firewall-cmd --zone=public --add-port=7199/tcp --permanent
firewall-cmd --zone=public --add-port=5432/tcp --permanent
firewall-cmd --zone=public --add-port=8143-8081/tcp --permanent
firewall-cmd --zone=public --add-port=3000/tcp --permanent
firewall-cmd --zone=public --add-port=2222/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-port=8180/tcp --permanent
firewall-cmd --zone=public --add-port=9000/tcp --permanent
firewall-cmd --zone=public --add-port=8080-8081/tcp --permanent
firewall-cmd --zone=public --add-port=7077/tcp --permanent
firewall-cmd --zone=public --add-port=8888/tcp --permanent
firewall-cmd --zone=public --add-port=4040/tcp --permanent
firewall-cmd --zone=public --add-port=7001-7006/tcp --permanent
firewall-cmd --reload
