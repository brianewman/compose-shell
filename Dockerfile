FROM ubuntu:latest

ENV docker_gid=999

RUN apt update && apt install  openssh-server sudo curl vim -y
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN groupadd -g ${docker_gid} docker
RUN sh get-docker.sh
RUN apt-get -y install docker-compose
RUN useradd -rm -s /bin/bash -g root -G sudo,docker -u 1000 user 
RUN echo 'user:OOicu812' | chpasswd

COPY run.sh
VOLUME /var/run/docker.sock
VOLUME /home
EXPOSE 22

WORKDIR /home/user
ENTRYPOINT [ "run.sh" ]
