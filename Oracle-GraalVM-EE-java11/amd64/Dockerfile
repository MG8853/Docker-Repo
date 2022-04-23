FROM --platform=linux/amd64 ubuntu:20.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite fontconfig tzdata iproute2

RUN cd /srv && mkdir jvm && cd jvm && \
    curl https://api.github.com/repos/graalvm/graalvm-ce-builds/releases/latest | \
    grep "browser_download_url.*.gz" | cut -d : -f 2,3 | tr -d \" | \
    grep linux | \
    grep -v sha256 | \
    grep amd64 | \
    grep java11 | \
    wget -O graalvm-ee.tar.gz -i - && \
    tar -xzvf graalvm-ee.tar.gz --strip-components 1 && rm graalvm-ee.tar.gz

ENV PATH=/srv/jvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
ENV JAVA_HOME=/srv/jvm

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
