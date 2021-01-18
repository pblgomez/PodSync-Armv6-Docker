FROM alpine:3.13
LABEL maintainer="Pablo Gómez <pblgomez@gmail.com>"

RUN apk update && apk add ca-certificates
RUN apk upgrade -U
RUN apk add \
  py3-pip \
  ffmpeg
RUN pip3 install --upgrade pip
RUN pip3 install youtube-dl
COPY podsync /app/podsync
# COPY config.toml /app/config.toml
WORKDIR /app
CMD ["/app/podsync"]
