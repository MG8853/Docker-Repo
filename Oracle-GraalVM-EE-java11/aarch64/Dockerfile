FROM --platform=linux/arm64 ubuntu:22.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite3 fontconfig tzdata iproute2 jq

RUN cd /srv && mkdir jvm && cd jvm && \
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate \
    'https://docs.google.com/uc?export=download&id=1cHIbrxUOUJsxwnzXvN1c465laCSo9WAe' -O- | \
    sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1cHIbrxUOUJsxwnzXvN1c465laCSo9WAe" -O graalvm-ee.tar.gz && rm -rf /tmp/cookies.txt && \
    tar -xzvf graalvm-ee.tar.gz --strip-components 1 && rm graalvm-ee.tar.gz

ENV PATH=/srv/jvm/bin:$PATH
ENV JAVA_HOME=/srv/jvm

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
