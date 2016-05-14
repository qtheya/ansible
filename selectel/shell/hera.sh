#!/bin/bash

sudo docker run --name redis -m 4096M --cpuset-cpus="0-1" --restart=on-failure:3 -d redis -v /var/lib/redis:/data redis-server --appendonly yes                                                                    

sudo docker run -m 2048M --cpuset-cpus="6-7" -d --restart=on-failure:3 -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 25672:25672 --name rabbit rabbitmq:3


