FROM ubuntu:latest
ENV HOSTNAME="compose"

RUN apt-get update && apt-get -y install curl
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN apt-get -y install docker-compose
RUN useradd --no-log-init -r -g docker docker
USER docker

VOLUME /var/run/docker.sock
VOLUME /home/docker

WORKDIR /home/docker
ENTRYPOINT [ "/bin/bash" ]
