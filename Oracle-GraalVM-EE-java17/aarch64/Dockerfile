FROM --platform=$TARGETOS/$TARGETARCH ubuntu:20.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite fontconfig tzdata iproute2

RUN cd /srv && \
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate \
    'https://docs.google.com/uc?export=download&id=1j-68f-SbGKvexcOlIjja2JHUVmqwDOO2' -O- | \
    sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1j-68f-SbGKvexcOlIjja2JHUVmqwDOO2" -O graalvm-ee.tar.gz && rm -rf /tmp/cookies.txt && \
    tar -xzvf graalvm-ee.tar.gz --strip-components 1 && rm graalvm-ee.tar.gz

ENV PATH=/srv/jvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
ENV JAVA_HOME=/srv/jvm

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]