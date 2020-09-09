FROM ubuntu:20.04
LABEL maintainer="zaberchann" version="20.04"

ARG WORKSPACE_DIR=/workspace
WORKDIR ${WORKSPACE_DIR}

RUN apt-get update \
    && apt-get install -y vim curl git npm

RUN git clone https://github.com/iwestlin/gd-utils \
    && cd gd-utils \
    && npm install --unsafe-perm=true --allow-root

VOLUME /workspace/gd-utils

RUN echo "gdcopy(){ \
    node --max-old-space-size=4096 /gd-utils/copy "$1" -S \
} \
\
gdcount(){ \
    node --max-old-space-size=4096 /gd-utils/count "$1" -S \
}" > ~/.bashrc
