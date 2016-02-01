FROM kurron/docker-oracle-jdk-8:jdk1.8.0_72

MAINTAINER Ron Kurr <kurr@kurron.org>

ENV DEBIAN_FRONTEND noninteractive

# Install Ansible
RUN apt-get --quiet update && \
    apt-get --quiet --yes install python-yaml python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools python-pkg-resources git python-pip && \
    apt-get clean && \
    mkdir /etc/ansible/ && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts && \
    mkdir /opt/ansible/ && \
    git clone http://github.com/ansible/ansible.git /opt/ansible/ansible

WORKDIR /opt/ansible/ansible

RUN git submodule update --init
    
# set the environment variables 
ENV PYTHONPATH /opt/ansible/ansible/lib 
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library
ENV PATH $PATH:/opt/ansible/ansible/bin

# export meta-data about this container
LABEL org.kurron.ansible.version="latest-from-git"

