FROM ubuntu:14.04
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN apt-get -y install apt-transport-https wget curl
RUN apt-get update && apt-get -y upgrade
RUN apt-get install python3 python3-dev python3-pip
RUN pip3 install psycopg2 pika paramiko

RUN mkdir -m 777 -p /var/project

VOLUME /var/project


