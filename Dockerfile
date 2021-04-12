FROM ubuntu:20.04

LABEL maintainer="jackliusr@gmail.com"

WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y \
    automake \
    build-essential \
    libssl-dev \
    libtool \
  && rm -rf /var/lib/apt/lists/*
RUN sh /app/autogen.sh
RUN ./configure
RUN make && make install
RUN rm -rf /app
WORKDIR /tmp
