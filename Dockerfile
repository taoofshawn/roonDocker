FROM debian:9
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && \
apt-get -y install bash curl bzip2 ffmpeg cifs-utils

WORKDIR /app
ARG ROON_SERVER_PKG=RoonServer_linuxx64.tar.bz2
ARG ROON_SERVER_URL=http://download.roonlabs.com/builds/${ROON_SERVER_PKG}

RUN echo "$ROON_SERVER_PKG" && echo "$ROON_SERVER_URL" && \
curl -O $ROON_SERVER_URL && \
tar xjf $ROON_SERVER_PKG

ENTRYPOINT ["/app/RoonServer/start.sh"]

