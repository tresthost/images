FROM        --platform=$TARGETOS/$TARGETARCH debian:buster-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

LABEL       org.opencontainers.image.source="https://github.com/tresthost/images"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update && apt upgrade -y \
				&& apt install -y gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
    			libfontconfig libicu63 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape203 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates tzdata \
    			liblua5.3 libz-dev rapidjson-dev \
				&& update-locale lang=en_US.UTF-8 \
				&& dpkg-reconfigure --frontend noninteractive locales \
				&& useradd -m -d /home/container -s /bin/bash container

USER        container
ENV         USER=container HOME=/home/container
ENV         DEBIAN_FRONTEND noninteractive

WORKDIR     /home/container

# Install pnpm
RUN         curl -fsSL https://get.pnpm.io/install.sh | sh

# Install yarn
RUN         curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource-archive-keyring.gpg
RUN         echo "deb [signed-by=/usr/share/keyrings/nodesource-archive-keyring.gpg] https://deb.nodesource.com/node_19.x buster main" > /etc/apt/sources.list.d/nodesource.list
RUN         apt-get update && apt-get install -y nodejs
RUN         npm install -g yarn

# Install the latest version of npm
RUN         npm install -g npm@latest

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]