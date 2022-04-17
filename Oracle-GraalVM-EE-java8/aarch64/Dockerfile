FROM --platform=$TARGETOS/$TARGETARCH ubuntu:20.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite fontconfig tzdata iproute2

RUN cd /srv && \
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1iyHZ1jgjuFmZTYgSV7Q0A68PzfrenAAO' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1iyHZ1jgjuFmZTYgSV7Q0A68PzfrenAAO" -O graalvm-ee-java8-linux-amd64-21.3.1.tar.gz && rm -rf /tmp/cookies.txt
RUN tar -xzf graalvm-ee-* && mkdir jvm && mv /srv/graalvm-ee-*/* /srv/jvm && rm -fr graalvm-ee-*

ENV PATH=/srv/jvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
ENV JAVA_HOME=/srv/jvm

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
