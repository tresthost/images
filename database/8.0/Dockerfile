# -----------------------------------------------------
# MySQL Image for Pterodactyl
# -----------------------------------------------------
FROM        --platform=$TARGETOS/$TARGETARCH mysql:8.0

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL org.opencontainers.image.source="https://github.com/tresthost/images"
LABEL org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt install -y netcat \
            && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ../entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]