FROM --platform=$TARGETOS/$TARGETARCH ubuntu:20.04

LABEL author="MG8853" maintainer="TeamFelNull"

ENV DEBIAN_FRONTEND=noninteractive

RUN perl -p -i.bak -e 's%(deb(?:-src|)\s+)https?://(?!archive.canonical.com|security.ubuntu.com)[^\s]+%$1http://ftp.udx.icscoe.jp/Linux/ubuntu/%' /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget && \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && add-apt-repository -y ppa:chris-lea/redis-server && \
    apt-get update && apt-get -y upgrade && \
    apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev redis-server && \
    apt-get -y install php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip}

WORKDIR /usr/local/nginx
RUN wget https://nginx.org/download/nginx-1.20.2.tar.gz && \
    tar -zxvf nginx-1.20.2.tar.gz && \
    cd nginx-1.20.2 && \
    git clone https://github.com/google/ngx_brotli.git && \
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

RUN useradd -d /home/container -m container
RUN chown -R container:container /usr/local/nginx

USER container
ENV USER=container HOME=/home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
