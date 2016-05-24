FROM registry.o-labs.ru/java
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN echo 'deb http://www.apache.org/dist/cassandra/debian 35x main' >> /etc/apt/sources.list.d/cassandra.list

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 514A2AD631A57A16DD0047EC749D6EEC0353B12C

ENV CASSANDRA_VERSION 3.5

RUN apt-get update 
RUN apt-get -y install python-minimal
RUN wget -P /opt https://launchpad.net/ubuntu/+archive/primary/+files/python-support_1.0.15_all.deb 
RUN dpkg -i /opt/python-support_1.0.15_all.deb
RUN rm -rf /opt/*
RUN apt-get install -y cassandra="$CASSANDRA_VERSION" 
RUN rm -rf /var/lib/apt/lists/*
ENV CASSANDRA_CONFIG /etc/cassandra

VOLUME /var/lib/cassandra/data /var/lib/cassandra/commitlog 

EXPOSE 7000 7001 7199 9042 9160

CMD [ "cassandra", "-f", "-R" ]

