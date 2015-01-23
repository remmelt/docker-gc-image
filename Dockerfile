FROM python:2-slim

MAINTAINER Remmelt Pit <remmelt@remmelt.com>

RUN mkdir /docker-gc
WORKDIR /docker-gc

ENV docker-gc.last-commit-hash 1b5d533172fa3707dcd4e5a4a3b7cd25d6e6e237
ADD https://raw.githubusercontent.com/spotify/docker-gc/master/docker-gc /docker-gc/docker-gc
RUN chmod +x /docker-gc/docker-gc

ENV DOCKER_SHA256 b4fb75be087eafe6cda26038a045854ab2d497adad9276a45c37d7d55da764fc
ADD https://get.docker.io/builds/Linux/x86_64/docker-1.4.1 /bin/docker
RUN echo "$DOCKER_SHA256 /bin/docker" | sha256sum -c -
RUN chmod +x /bin/docker

CMD ./docker-gc
