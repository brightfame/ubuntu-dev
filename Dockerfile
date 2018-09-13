FROM ubuntu:16.04

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      curl \
      dnsutils \
      wget \
      dnsutils \
      jq \
      libcrypt-hcesha-perl \
      python3-apt \
      python3-pip \
      rsyslog \
      software-properties-common \
      sudo \
      git \
      vim \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu        $(lsb_release -cs)   stable" \
    && apt-get update \
    && apt-get install -y docker-ce \
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
