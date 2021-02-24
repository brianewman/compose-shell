#! /bin/bash
if test -f /home/.done; then
  echo "already done"
else
  groupadd -g `ls -l /var/run/docker.sock | awk '{print $4}'` host_docker
  usermod -a -G host_docker user
  touch /home/.done
fi
service ssh start
/bin/bash
