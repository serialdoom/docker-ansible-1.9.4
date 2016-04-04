# sshd
#
# VERSION               0.0.2

FROM ubuntu:15.10
MAINTAINER Mike Christof <mhristof@gmail.com>

RUN apt-get update &&\
    apt-get install -y python-pip git python-dev silversearcher-ag upstart shellcheck wget curl php5 &&\
    pip install ansible==1.9.4 flake8 &&\
    apt-get autoremove &&\
    apt-get autoclean
#RUN apt-get install -y cabal-install &&\
    #cabal update &&\
    #cabal install shellcheck
