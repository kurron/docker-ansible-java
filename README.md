#Overview
This project is a simple Docker image that combines the [Oracle JDK](http://www.oracle.com/technetwork/java/index.html) 
with the [Ansible](http://www.ansible.com/) provisioning tool. This combination is useful in CI pipelines where you 
build a JVM project and deploy it to some infrastructure for integration testing.

#Prerequisites
* a working [Docker](http://docker.io) engine
* a working [Docker Compose](http://docker.io) installation

#Building
Type `docker-compose build` to build the image.

#Installation
Docker will automatically install the newly built image into the cache.

#Tips and Tricks

##Launching The Image

`docker-compose up` will launch the image allowing you to begin working on projects. The Docker Compose file is 
configured to mount your home directory into the container.  

#Troubleshooting

#License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

#List of Changes

