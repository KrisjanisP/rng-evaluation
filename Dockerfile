# Use a base image that includes build essentials and wget
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    automake \
    libtool \
    bash \
    git \
    ruby \
    libgsl-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /hello
RUN wget https://github.com/eddelbuettel/dieharder/archive/refs/tags/3.31.1.4.tar.gz
RUN tar -xzvf 3.31.1.4.tar.gz
WORKDIR /hello/dieharder-3.31.1.4

RUN autoreconf --install
RUN ./configure --disable-shared
RUN make
RUN make install

# RUN LD_LIBRARY_PATH=/usr/lib
# RUN export LD_LIBRARY_PATH

CMD ["dieharder"]
