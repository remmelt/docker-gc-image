#docker-gc in a container

## USE SPOTIFY'S SUPPORTED IMAGE INSTEAD!
This project is now outdated. The good people at Spotify have added a Dockerfile to the official docker-gc repository. Here's the [official Spotify docker-gc image](https://registry.hub.docker.com/u/spotify/docker-gc/).

This is [Spotify's docker-gc](https://github.com/spotify/docker-gc) in a docker container. No need to build the deb, or anything.

##How to run garbage collection
You can run the docker-gc script by issueing the following command.

`docker run --rm --volume /var/run/docker.sock:/var/run/docker.sock remmelt/docker-gc`

Note that this does not install or run any cron jobs, you have to do that yourself.

For [documentation on docker-gc](https://github.com/spotify/docker-gc), please see the Spotify repository.
