FROM python:2-slim

MAINTAINER Remmelt Pit <remmelt@remmelt.com>

RUN mkdir /docker-gc
WORKDIR /docker-gc

ENV DOCKER_GC_SHA256 a406b7bb75b372e698c944cf53d069391c3d2a115f0e6fd7146d48fa364eea76
ADD https://raw.githubusercontent.com/spotify/docker-gc/master/docker-gc /docker-gc/docker-gc
RUN echo "$DOCKER_GC_SHA256 /docker-gc/docker-gc" | sha256sum -c -
RUN chmod +x /docker-gc/docker-gc

ENV DOCKER_SHA256 b4fb75be087eafe6cda26038a045854ab2d497adad9276a45c37d7d55da764fc
ADD https://get.docker.io/builds/Linux/x86_64/docker-1.4.1 /bin/docker
RUN echo "$DOCKER_SHA256 /bin/docker" | sha256sum -c -
RUN chmod +x /bin/docker

CMD ./docker-gc
