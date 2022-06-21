FROM --platform=$TARGETOS/$TARGETARCH ubuntu:20.04

LABEL author="MG8853" maintainer="TeamFelNull"

ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -d /home/container -m container

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget
RUN add-apt-repository -y ppa:ondrej/php && add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get update && \
    apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev redis-server \
    mariadb-server
RUN apt-get -y install autoconf dpkg-dev file g++ gcc libc-dev make pkg-config re2c xz-utils gnupg dirmngr
RUN apt-get -y install libargon2-dev libcurl4-openssl-dev libonig-dev libreadline-dev libsodium-dev libsqlite3-dev \
    libssl-dev libxml2-dev zlib1g-dev
RUN apt-get -y install libaprutil1-ldap libldap-common
RUN apt-get -y install bzip2 dirmngr dpkg-dev gcc gnupg libapr1-dev libaprutil1-dev libbrotli-dev libcurl4-openssl-dev \
    libjansson-dev liblua5.2-dev libnghttp2-dev libpcre3-dev libssl-dev libxml2-dev make wget zlib1g-dev libxslt-dev \
    libzip-dev libxslt1-dev libmariadb-dev mariadb-client
RUN apt-get -y install libmagickwand-dev libmysqlclient-dev libmariadbclient-dev


WORKDIR /usr/local/nginx

RUN wget https://nginx.org/download/nginx-1.20.2.tar.gz && \
    tar -zxvf nginx-1.20.2.tar.gz && \
    cd nginx-1.20.2 && \
    git clone https://github.com/google/ngx_brotli.git
RUN cd /usr/local/nginx/nginx-1.20.2/ngx_brotli && git submodule update --init && cd /usr/local/nginx/nginx-1.20.2 && \
    ./configure --prefix=/usr/local/nginx --user=container --with-http_ssl_module --with-ipv6 --with-threads \
    --with-stream --with-stream_ssl_module --with-stream_realip_module --with-stream_ssl_preread_module \
    --with-stream=dynamic --with-compat --add-dynamic-module=/usr/local/nginx/nginx-1.20.2/ngx_brotli && \
    make && make install
RUN cp /usr/local/nginx/nginx-1.20.2/objs/ngx_stream_module.so /usr/local/nginx/modules/ && \
    cp /usr/local/nginx/nginx-1.20.2/objs/ngx_http_brotli_filter_module.so /usr/local/nginx/modules/ && \
    cp /usr/local/nginx/nginx-1.20.2/objs/ngx_http_brotli_static_module.so /usr/local/nginx/modules/
RUN cd /usr/local/nginx/ && rm -rf nginx-1.20.2 && rm -rf nginx-1.20.2.tar.gz

RUN ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx



RUN chown -R container:container /usr/local/nginx

USER container
ENV USER=container HOME=/home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
