FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo git curl

RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu
CMD /bin/bash
