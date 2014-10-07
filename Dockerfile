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
RUN apt-get install -y dpkg-dev autotools-dev autoconf automake build-essential libtool pkg-config yasm debhelper dh-systemd libexpat-dev libgd2-dev libgeoip-dev liblua5.1-dev libmhash-dev libpam0g-dev libpcre3-dev libperl-dev libssl-dev libxslt1-dev po-debconf zlib1g-dev git curl ruby-dev nodejs-dev npm
