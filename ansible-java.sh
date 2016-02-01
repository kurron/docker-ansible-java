#!/bin/bash

CMD="docker run \
       --rm \
       --name ansible-java \
       --interactive \
       --tty \
       --net "host" \
       --user=$(id -u $(whoami)):$(id -g $(whoami)) \
       --volume $(pwd):/pwd \
       kurron/docker-ansible-java:latest"

echo $CMD
eval $CMD $*

