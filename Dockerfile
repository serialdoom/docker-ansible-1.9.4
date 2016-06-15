# sshd
#
# VERSION               0.0.2

FROM ubuntu:14.04.3
MAINTAINER Mike Christof <mhristof@gmail.com>

ARG ansible_version=1.9.6
RUN apt-get update &&\
    apt-get install -y libssl-dev libffi-dev python-pip libcurl4-openssl-dev git mysql-client python-dev python-mysqldb
RUN pip install ansible==${ansible_version} && pip install --upgrade setuptools
RUN apt-get clean &&\
        apt-get autoremove &&\
        apt-get autoclean &&\
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/
