FROM debian:stretch-slim
MAINTAINER Wojciech Nizinski <niziak@spox.org>

RUN apt-get update && \
    apt-get install -y build-essential texinfo wget curl ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
