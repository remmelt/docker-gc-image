FROM python:2-slim

MAINTAINER Remmelt Pit <remmelt@remmelt.com>

RUN mkdir /docker-gc
WORKDIR /docker-gc

ENV DOCKER_GC_SHA256 495a553b3a5f3ca3fc30ba95b1b56d86353853d347bbfbe0fd6d5f1433b6f7cd
ADD https://raw.githubusercontent.com/spotify/docker-gc/master/docker-gc /docker-gc/docker-gc
RUN echo "$DOCKER_GC_SHA256 /docker-gc/docker-gc" | sha256sum -c -
RUN chmod +x /docker-gc/docker-gc

ENV DOCKER_SHA256 f0a51ba39eb0be48875a8f81cc59e5ebb9aca0dddf738ea70a5fbd13de409a16
ADD https://get.docker.io/builds/Linux/x86_64/docker-1.3.2 /bin/docker
RUN echo "$DOCKER_SHA256 /bin/docker" | sha256sum -c -
RUN chmod +x /bin/docker

CMD ./docker-gc
