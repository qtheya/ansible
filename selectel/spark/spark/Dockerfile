FROM registry.o-labs.ru/java 
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN apt-get -y install openssh-server

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

ENV SPARK_HOME /usr/local/spark
ENV PATH /usr/bin/scala:/usr/lib/jvm/java-8-oracle/bin:/usr/local/spark/bin:$PATH
ENV SPARK_HOME /usr/local/spark

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_PORT 8888

RUN sed '1d' /etc/hosts > tmpHosts
RUN cat tmpHosts > /etc/hosts
RUN rm tmpHosts
RUN mkdir -m 755 -p /var/run/sshd

COPY spark.deb /opt/spark.deb
RUN dpkg -i /opt/spark.deb
RUN rm -rf /opt/spark.deb
VOLUME /tmp

EXPOSE 7077 8080-8087 8888 22 
