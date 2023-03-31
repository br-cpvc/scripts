#!/usr/bin/env bash
# from: https://blog.baudson.de/blog/stop-and-remove-all-docker-containers-and-images
echo 'docker ps -aq'
echo 'docker stop $(docker ps -aq)'
echo 'docker rm $(docker ps -aq)'
echo 'docker rmi $(docker images -q)'
echo docker image prune
echo docker image prune -a
