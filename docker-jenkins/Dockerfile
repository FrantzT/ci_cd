FROM jenkins/jenkins:lts

USER root

ARG DOCKER_GID=497

RUN groupadd -g ${DOCKER_GID:-497} docker

ARG DOCKER_ENGINE=1.10.2
ARG DOCKER_COMPOSE=1.6.2


RUN apt-get update && apt-get install -y ruby curl python-dev python-setuptools gcc make libssl-dev \
    apt-transport-https ca-certificates gnupg-agent software-properties-common -y && \
    easy_install pip


RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    # had to download it from package, as it ha sdependencies issue
    # curl -O https://download.docker.com/linux/ubuntu/dists/bionic/pool/edge/amd64/containerd.io_1.2.2-3_amd64.deb && \
    # apt install ./containerd.io_1.2.2-3_amd64.deb -y && \
    apt-get update -y && \
    #apt-get install libseccomp2 docker-ce=5:18.09.0~3-0~ubuntu-xenial docker-ce-cli=5:18.09.0~3-0~ubuntu-xenial containerd.io -y && \
    apt-get install docker-ce docker-ce-cli containerd.io=1.2.2-3 -y && \
    usermod -aG docker jenkins && \
    usermod -aG users jenkins

RUN pip install docker-compose==${DOCKER_COMPOSE:-1.6.2} && \
    pip install ansible boto boto3

# Change to jenkins user
USER jenkins

# Add Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
