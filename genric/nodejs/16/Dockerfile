#
# Copyright (c) 2021 Matthew Penner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

FROM node:16-alpine

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
    && rm -rf /var/cache/apk/*

# Install basic fonts
RUN apk add --no-cache font-adobe-100dpi font-adobe-75dpi font-adobe-utopia-100dpi font-adobe-utopia-75dpi \
    font-adobe-utopia-type1 font-arphic-uming font-bh-ttf font-bh-type1 font-bitstream-100dpi font-bitstream-75dpi \
    font-bitstream-type1 font-cronyx-cyrillic font-cursor-misc font-daewoo-misc font-dec-misc font-ibm-type1 \
    font-isas-misc font-jis-misc font-micro-misc font-misc-cyrillic font-misc-ethiopic font-misc-meltho \
    font-misc-misc font-mutt-misc font-schumacher-misc font-sony-misc font-sun-misc font-winitzki-cyrillic \
    font-xfree86-type1 font-misc-ethiopic font-sony-misc

# Install canvas and napi-rs
RUN apk add --no-cache --virtual .canvas-deps automake autoconf libtool cairo-dev pango-dev libjpeg-turbo-dev giflib-dev \
    && yarn global add canvas napi-rs \
    && apk del .canvas-deps

ENV USER=container HOME=/home/container
ENV FONTCONFIG_PATH=/etc/fonts
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]