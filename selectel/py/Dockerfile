FROM ubuntu:16.04

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN apt-get -y install apt-transport-https wget curl 

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install libxml2-dev libxslt1-dev libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev libblas-dev liblapack-dev

RUN mkdir -m 777 -p /var/bigdata

VOLUME /var/bigdata


