# sshd
#
# VERSION               0.0.2

FROM ubuntu:15.10
MAINTAINER Mike Christof <mhristof@gmail.com>

ARG ansible_version=1.9.4
RUN apt-get update &&\
    apt-get install -y gcc-4.9 python-pip libcurl4-openssl-dev zlib1g-dev git python-dev silversearcher-ag upstart shellcheck wget curl php5 &&\
    pip install flake8 &&\
    apt-get autoremove &&\
    apt-get autoclean
RUN pip install ansible==${ansible_version}
RUN pip install sh
RUN apt-get install -y nodejs &&\
    ln -s /usr/bin/nodejs /usr/bin/node &&\
    wget https://github.com/npm/npm/archive/v3.8.5.tar.gz -O /tmp/npm-3.8.5.tar.gz &&\
    tar xvf /tmp/npm-3.8.5.tar.gz &&\
    cd npm-3.8.5 && make install && cd / &&\
    rm -rf /npm-3.8.5 /tmp/npm-3.8.5.tar.gz &&\
    npm install -g grunt-cli &&\
    apt-get autoremove &&\
    apt-get autoclean
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo &&\
    chmod a+x /usr/bin/repo
#RUN apt-get install -y cabal-install &&\
    #cabal update &&\
    #cabal install shellcheck
