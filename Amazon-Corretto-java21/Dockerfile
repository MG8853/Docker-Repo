FROM --platform=$TARGETOS/$TARGETARCH debian:13

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ARG version=21.0.10.7-1
# In addition to installing the Amazon corretto, we also install
# fontconfig. The folks who manage the docker hub's
# official image library have found that font management
# is a common usecase, and painpoint, and have
# recommended that Java images include font support.
#
# See:
#  https://github.com/docker-library/official-images/blob/master/test/tests/java-uimanager-font/container.java

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg fontconfig java-common wget
RUN wget -O - https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list
RUN apt-get update \
    && apt-get install -y java-21-amazon-corretto-jdk=1:$version \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        curl gnupg

ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto



ENV DEBIAN_FRONTEND=noninteractive
##useradd -d /home/container -m container &&
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite3 fontconfig tzdata iproute2 jq \
    libsodium23 libopus0 libssl3 libstdc++6 libgcc-s1 libatomic1 zlib1g

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
