FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo git curl

RUN useradd -m ubuntu && echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo

USER ubuntu
CMD /bin/bash
