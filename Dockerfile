FROM debian:10

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get -qq update \
    && apt-get --yes --quiet install --no-install-recommends \
        ca-certificates \
        curl \
        libnss3 \
        pulseaudio-utils \
    && curl -fsSLO https://zoom.us/client/latest/zoom_amd64.deb \
    && apt-get install --yes --quiet \
        ./zoom_amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* zoom_amd64.deb

ENTRYPOINT ["zoom"]
