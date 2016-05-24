FROM ubuntu:16.04

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone                                                                                                                                     
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN apt-get update
RUN apt-get -y upgrade
RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
