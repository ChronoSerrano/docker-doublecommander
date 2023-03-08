FROM jlesage/baseimage-gui:debian-11

LABEL org.opencontainers.image.source = "https://github.com/ChronoSerrano/docker-doublecommander"
LABEL org.opencontainers.image.description="My DoubleCommander Image"
LABEL org.opencontainers.image.licenses=Unlicense

ENV APP_NAME=DoubleCommander
ENV DOCKER_IMAGE_VERSION=0.0.1

## Install dependencies and set icon
RUN add-pkg     doublecmd-gtk \
                doublecmd-plugins \
                libsmbclient \
                libssh2-1 \
    && install_app_icon.sh "https://doublecommander.com/icon.png"

## Copy the start script
COPY startapp.sh /startapp.sh
VOLUME /config