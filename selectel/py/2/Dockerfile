FROM ubuntu:14.04
MAINTAINER DevOps "alexander.kuzmovych@o-labs.ru"

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN apt-get -y install apt-transport-https wget curl
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install python python-dev python-pip python-setuptools \
	 	    python-numpy python-psycopg2 python-pandas libblas-dev liblapack-dev python-configparser python-matplotlib ipython libxml2-dev libxslt1-dev python-lxml \
		    libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk python-unicodecsv python-xlrd python-xlsxwriter 

RUN pip install sqlalchemy multiprocessing rpy2 pathos copy seaborn scikit-learn cython cytoolz ipywidgets requests xlsxwriter xgboost

RUN mkdir -m 777 -p /var/project

VOLUME  /var/project

