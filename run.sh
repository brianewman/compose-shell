#! /bin/bash
groupadd -g `ls -l /var/run/docker.sock | awk '{print $4}'` host_docker
usermode -a -G host_docker user
service ssh start
