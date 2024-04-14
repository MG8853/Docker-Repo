FROM --platform=$TARGETOS/$TARGETARCH python:3.11-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get install -y \
        sudo \
        wget \
        git \
        dnsutils \
        curl \
        unzip \
        git \
        build-essential \
        ca-certificates \
        openssl \
        tar \
        sqlite3 \
        fontconfig \
        tzdata \
        iproute2 \
        jq \
        p7zip-full \
        libsndfile1 \
        ffmpeg \
        procps

RUN apt-get install -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        curl \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libxml2-dev \
        libxmlsec1-dev \
        libffi-dev \
        liblzma-dev \
        git

RUN apt-get install -y \
        git \
        wget \
        cmake \
        ca-certificates \
        build-essential \
        gosu \
        libsndfile1

RUN useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
