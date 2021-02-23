FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo curl vim -y
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN apt-get -y install docker-compose
RUN groupadd 1002
RUN useradd -rm -s /bin/bash -g root -G sudo,docker,1002 -u 1000 user 
RUN echo 'user:OOicu812' | chpasswd
RUN service ssh start
USER user

VOLUME /var/run/docker.sock
VOLUME /home
EXPOSE 22

WORKDIR /home/user
ENTRYPOINT [ "/bin/bash" ]
