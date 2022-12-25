FROM ubuntu:22.04
MAINTAINER Aleksey Karpov <admin@bitaps.com>
RUN apt-get update
RUN apt-get -y install git
RUN git clone https://github.com/bitcoin/bitcoin -v
RUN cd bitcoin;git checkout "v24.0.1";
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev
RUN apt-get -y install libzmq3-dev
RUN cd bitcoin;./autogen.sh;./configure --disable-wallet --without-gui;make
RUN cd bitcoin;make install
