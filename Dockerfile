FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y python3 python3-pip \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip
USER jenkins