FROM node:16-bullseye

ENV DEBIAN_FRONTEND=noninteractive
##useradd -d /home/container -m container &&
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite3 fontconfig tzdata iproute2 p7zip-full

WORKDIR /

RUN cd / && \
    wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.11.0%2Bcpu.zip && \
    unzip libtorch-cxx11-abi-shared-with-deps-1.11.0+cpu.zip

ENV LD_LIBRARY_PATH=/libtorch/lib

RUN cd / && \
    curl -s https://api.github.com/repos/VOICEVOX/voicevox_engine/releases/latest \
    | grep "browser_download_url.*linux-cpu.7z.001" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -  \
    && mv /linux-cpu.7z.001 /linux-cpu.7z
RUN cd / && \
    7z x /linux-cpu.7z \
    && mv /linux-cpu /voicevox_core \
    && rm -fr /voicevox_core/libcore.so \
    && mv /voicevox_core/libcore_cpu_x64.so /voicevox_core/libcore.so

ENV VOICEVOX_CORE="/voicevox_core/libcore.so"

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
