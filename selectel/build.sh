#!/bin/bash

cd /opt/u1604
docker build -t u1604 .
docker tag u1604 registry.o-labs.ru/ubuntu1604 
docker push registry.o-labs.ru/ubuntu1604
cd /opt/java
docker build -t java .
docker tag java registry.o-labs.ru/java
docker push registry.o-labs.ru/java
cd /opt/scala
docker build -t scala .
docker tag scala registry.o-labs.ru/scala
docker push registry.o-labs.ru/scala
cd /opt/cassandra
docker build -t cassandra .
docker tag cassandra registry.o-labs.ru/cassandra
docker push registry.o-labs.ru/cassandra
cd /opt/spark/spark
docker build -t spark .
docker tag spark registry.o-labs.ru/spark                                                                                                                        
docker push registry.o-labs.ru/spark
cd /opt/spark/sparkm
docker build -t spark_master .
docker tag spark_master registry.o-labs.ru/spark_master                                                                                                                  
docker push registry.o-labs.ru/spark_master
cd /opt/spark/sparkw
docker build -t spark_worker .
docker tag spark_worker registry.o-labs.ru/spark_worker                                                                                                                  
docker push registry.o-labs.ru/spark_worker
