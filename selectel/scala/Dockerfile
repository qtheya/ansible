FROM registry.o-labs.ru/java

RUN wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
RUN dpkg -i scala-2.11.8.deb
RUN apt-get -y install scala

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get -y install sbt

ENV SCALA_HOME /usr/share/scala
ENV SBT_HOME /usr/share/sbt-launcher-packaging
ENV PATH $SBT_HOME/bin:/usr/share/scala:$PATH

EXPOSE 22 8083 8087 4040 
