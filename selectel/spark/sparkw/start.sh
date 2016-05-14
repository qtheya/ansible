#!/bin/bash

/usr/local/spark/sbin/start-slave.sh spark://sparkmaster:7077 && /usr/sbin/sshd -D
