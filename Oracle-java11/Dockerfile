FROM store/oracle/jdk:11

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

RUN yum update -y \
    && yum install -y sudo wget git curl unzip tar tzdata iproute2 jq sqlite3 fontconfig openssl ca-certificates

USER container
ENV USER=container HOME=/home/container
ENV PATH=/usr/java/jdk-11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
