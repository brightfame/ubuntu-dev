FROM ubuntu:16.04

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      wget \
      dnsutils \
      jq \
      python3-apt \
      python3-pip \
      rsyslog \
      software-properties-common \
      sudo \
      git \
      vim \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# Install AWS cli: https://docs.aws.amazon.com/cli/latest/userguide/installing.html
RUN ln -s /usr/bin/pip3 /usr/bin/pip \
    && pip install --upgrade setuptools \
    && pip install --upgrade awscli

RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu
CMD /bin/bash
