FROM --platform=$TARGETOS/$TARGETARCH ubuntu:focal

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL org.opencontainers.image.source="https://github.com/tresthost/images"
LABEL org.opencontainers.image.licenses=MIT

# Set non-interactive mode for package installation
ENV DEBIAN_FRONTEND=noninteractive

# Pre-configure tzdata package to avoid interactive prompt
RUN echo "Europe" > /tmp/timezone && \
    ln -fs /usr/share/zoneinfo/$(cat /tmp/timezone) /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    rm /tmp/timezone

RUN apt update && apt upgrade -y && \
    apt install -y gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0

RUN apt install -y libfontconfig libicu66 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape203 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates

RUN apt install -y liblua5.3 libz-dev rapidjson-dev

RUN update-locale LANG=en_US.UTF-8 && \
    dpkg-reconfigure --frontend noninteractive locales && \
    useradd -m -d /home/container -s /bin/bash container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]