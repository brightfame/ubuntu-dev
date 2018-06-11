FROM ubuntu:16.04

RUN apt-get update \
      && apt-get -y --no-install-recommends install sudo git curl \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu
CMD /bin/bash
