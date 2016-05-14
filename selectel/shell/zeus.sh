#!/bin/bash

#docker run --cpuset-cpus="0-15" -p 5432:5432 --restart=on-failure:3 -v /etc/postgresql/main:/etc/postgresql/9.5/main -v /var/lib/postgresql:/var/lib/postgresql -d --name postgres postgres:latest   



docker run -d --name spark_master -m 40G --cpuset-cpus="15-28" -p 8080-8081:8080-8081 -p 7077:7077 -p 8888:8888 -p 4040:4040 -p 7001-7006:7001-7006 \
 -v /usr/local/spark/spark-env.sh:/usr/local/spark/conf/spark-env.sh -v /usr/local/spark/start-master.sh:/usr/local/spark/sbin/start-master.sh spark/master




docker run -d -m 48G --cpuset-cpus="22-31" -p 7000-7001:7000-7001 -p 7199:7199 -p 9042:9042 -p 9160:9160 -v /etc/cassandra/cassandra.yaml:/etc/cassandra/cassandra.yaml \
   -v /var/lib/cassandra/data:/var/lib/cassandra/data:Z \
   -v /var/lib/cassandra/commitlog:/var/lib/cassandra/commitog:Z \
   --restart=on-failure:3 \
   --name cassandra cassandra/local


firewall-cmd --zone=public --add-port=5432/tcp --permanent
firewall-cmd --zone=public --add-port=7000-7001/tcp --permanent
firewall-cmd --zone=public --add-port=9042/tcp --permanent
firewall-cmd --zone=public --add-port=9160/tcp --permanent
firewall-cmd --zone=public --add-port=7199/tcp --permanent
firewall-cmd --zone=public --add-port=5432/tcp --permanent
firewall-cmd --zone=public --add-port=9000/tcp --permanent
firewall-cmd --zone=public --add-port=8080-8081/tcp --permanent
firewall-cmd --zone=public --add-port=7077/tcp --permanent
firewall-cmd --zone=public --add-port=8888/tcp --permanent
firewall-cmd --zone=public --add-port=4040/tcp --permanent
firewall-cmd --zone=public --add-port=7001-7006/tcp --permanent
firewall-cmd --reload
