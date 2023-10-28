FROM node:14-alpine

LABEL author="Matthew Penner" maintainer="matthew@pterodactyl.io"
LABEL org.opencontainers.image.source="https://github.com/tresthost/images"
LABEL org.opencontainers.image.licenses=MIT

RUN apk add --update --no-cache ca-certificates curl ffmpeg git openssl sqlite tar tzdata \
    && apk add --no-cache --virtual .build-deps build-base gcc g++ make python3 \
    && apk add --no-cache pkgconfig pixman-dev cairo-dev pango-dev jpeg-dev giflib-dev \
    && apk add --no-cache fontconfig freetype freetype-dev \
    && apk add --no-cache vips-dev fftw-dev build-base glib-dev expat-dev \
    && curl -L https://unpkg.com/@pnpm/self-installer | node \
    && curl -o- -L https://yarnpkg.com/install.sh | sh \
    && apk add --no-cache openssh-client  # Install SSH client tools \
    && rm -rf /var/cache/apk/*

# Install common fonts
RUN apk add --no-cache ttf-dejavu

# Install canvas and napi-rs
RUN apk add --no-cache --virtual .canvas-deps automake autoconf libtool cairo-dev pango-dev libjpeg-turbo-dev giflib-dev \
    && apk add --no-cache build-base g++ \
    && npm install -g canvas napi-rs \
    && apk del .canvas-deps

ENV USER=container HOME=/home/container
ENV FONTCONFIG_PATH=/etc/fonts
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]