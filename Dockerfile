FROM ubuntu:20.04
RUN apt update
RUN apt-get install -y git wget autoconf make g++ libfuse-dev fuse
RUN mkdir /build
WORKDIR /build
RUN wget https://www.rarlab.com/rar/unrarsrc-5.9.4.tar.gz
RUN tar fxvz unrarsrc-5.9.4.tar.gz
RUN git clone https://github.com/hasse69/rar2fs.git

WORKDIR /build/unrar
RUN make lib

WORKDIR /build/rar2fs
RUN autoreconf -f -i
RUN ./configure --with-unrar=/build/unrar/
RUN make
