FROM ubuntu:14.04
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8


RUN apt-get -y install software-properties-common
RUN apt-get -y install apt-transport-https wget curl
RUN apt-add-repository ppa:phalcon/stable
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install php5-fpm php5-dev php5-cli php5-json php5-curl php5-gearman php5-mcrypt php-pear php-apc php5-pgsql php5-phalcon

RUN mkdir -m 777 -p /var/www


RUN sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 100M/g" /etc/php5/fpm/php.ini && \
sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 100M/g" /etc/php5/fpm/php.ini && \
sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
sed -i "/^listen /c listen = 127.0.0.1:9000" /etc/php5/fpm/pool.d/www.conf && \
echo "display_errors = On\nerror_reporting = E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED" >> /etc/php5/fpm/php.ini
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

VOLUME [ "/var/www/" ]

EXPOSE 9000

CMD [ "php5-fpm" ] 
