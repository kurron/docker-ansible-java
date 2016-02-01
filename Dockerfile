FROM kurron/docker-oracle-jdk-8:jdk1.8.0_72

MAINTAINER Ron Kurr <kurr@kurron.org>

ENV DEBIAN_FRONTEND noninteractive

# Install Ansible
RUN apt-get --quiet update && \
    apt-get --quiet --yes install python-setuptools python-dev && \
    apt-get clean && \
    easy_install pip && \
    pip install ansible 

# copy the Gradle pieces into the container
COPY gradle /opt/gradle/gradle/
COPY gradlew /opt/gradle/

# export meta-data about this container
LABEL org.kurron.ansible.version="latest-from-pip"
LABEL org.kurron.gradle.version="2.10"

VOLUME ["/home"]
VOLUME ["/pwd"]
WORKDIR /pwd

ENTRYPOINT ["/opt/gradle/gradlew"]
