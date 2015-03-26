FROM       ubuntu:trusty

MAINTAINER Jeffrey Wescott <jeffrey@cine.io>

# update apt sources to include non-free stuff
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' | tee /etc/apt/sources.list.d/multiverse.list
RUN echo 'deb-src http://archive.ubuntu.com/ubuntu/ trusty multiverse' | tee -a /etc/apt/sources.list.d/multiverse.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty-security multiverse' | tee -a /etc/apt/sources.list.d/multiverse.list
RUN echo 'deb-src http://archive.ubuntu.com/ubuntu/ trusty-security multiverse' | tee -a /etc/apt/sources.list.d/multiverse.list

# pull latest package index
RUN apt-get update

# install security updates and bug fixes
RUN apt-get upgrade -y

# install prerequisite packages
RUN apt-get install -y telnet dpkg-dev autotools-dev autoconf automake build-essential libtool pkg-config yasm debhelper dh-systemd libexpat-dev libgd2-dev libgeoip-dev liblua5.1-dev libmhash-dev libpam0g-dev libpcre3-dev libperl-dev libssl-dev libxslt1-dev po-debconf zlib1g-dev
# install useful tools
RUN apt-get install -y git curl
# install useful languages
RUN apt-get install -y ruby-dev python-dev golang
# set default gopath: http://golang.org/doc/code.html#GOPATH
RUN mkdir $HOME/go
ENV GOPATH $HOME/go

# https://github.com/joyent/node/wiki/installing-node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install -y nodejs
RUN npm update npm -g

# copy our SSH keys
COPY .ssh /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa
