FROM registry.o-labs.ru/ubuntu1604
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN apt-get -y install software-properties-common apt-transport-https maven

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && apt-key update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

