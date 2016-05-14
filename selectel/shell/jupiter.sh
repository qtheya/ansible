#/bin/bash

#sudo docker run -m 4096M --restart=on-failure:3 --cpuset-cpus="29-31" -p 8080:8080 -p 50000:50000 -v /var/lib/jenkins:/var/jenkins_home -d jenkins

sudo docker run --cpuset-cpus="0-15" -p 5432:5432 --restart=on-failure:3 -v /etc/postgresql/main:/etc/postgresql/9.5/main -v /var/lib/postgresql:/var/lib/postgresql -d --name postgres postgres:latest
