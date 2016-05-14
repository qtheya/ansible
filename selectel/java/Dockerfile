FROM registry.o-labs.ru/ubuntu1604
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN apt-get -y install software-properties-common apt-transport-https wget openssh-server maven

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && apt-key update && \                                                                                                                                                                            
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
RUN dpkg -i scala-2.11.8.deb
RUN apt-get -y install scala

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get -y install sbt
ENV SCALA_HOME /usr/share/scala
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH /usr/bin/scala:/usr/lib/jvm/java-8-oracle/bin:$PATH

EXPOSE 4040

