FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo curl vim -y
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN apt-get -y install docker-compose
RUN useradd -rm -s /bin/bash -g root -G sudo,docker -u 1000 user 
RUN echo 'user:password' | chpasswd
RUN passwd --expire user

COPY run.sh /usr/local/bin/run.sh 
RUN chmod +x /usr/local/bin/run.sh 
CMD ["run.sh"]

VOLUME /var/run/docker.sock
VOLUME /home

EXPOSE 22
WORKDIR /home/user

