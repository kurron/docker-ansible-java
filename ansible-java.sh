#!/bin/bash

CMD="docker run \
       --rm \
       --interactive \
       --tty \
       --net "host" \
       --user=$(id -u $(whoami)):$(id -g $(whoami)) \
       --volume $(pwd):/pwd \
       --volume $HOME:/home \
       --workdir=/pwd \
       --env=HOME=/home \
       --env=GRADLE_USER_HOME=/pwd \
       --env=org.gradle.project.user.dir=/pwd \
       --env=org.gradle.project.user.home=/home \
       --env=org.gradle.project.user.name=$(whoami) \
       kurron/docker-ansible-java:latest"

echo $CMD
eval $CMD $*

