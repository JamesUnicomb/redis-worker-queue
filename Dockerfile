FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y gcc cmake build-essential pkg-config git
RUN apt-get install -y libboost-all-dev

COPY install.sh main.cpp CMakeLists.txt ./

RUN bash install.sh

RUN mkdir build
RUN cd build
RUN cmake ..
RUN make

