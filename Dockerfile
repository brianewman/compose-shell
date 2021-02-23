FROM ubuntu:latest

VOLUME /home
EXPOSE 22

RUN apt update && apt install  openssh-server sudo curl vim -y
RUN service ssh start
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN apt-get -y install docker-compose
RUN useradd -rm -s /bin/bash -g root -G sudo,docker -u 1000 user 
RUN echo 'user:OOicu812' | chpasswd
USER user

VOLUME /var/run/docker.sock
WORKDIR /home/user
