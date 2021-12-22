FROM alpine:latest
MAINTAINER yumin9822 <yumin9822@gmail.com>

RUN apk update && apk add \
	transmission-daemon \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /transmission/{download,watch} \
	&& chmod -R 777 /transmission
RUN wget --no-check-certificate https://github.com/ronggang/transmission-web-control/raw/master/release/install-tr-control.sh -O /tmp/tr-control-easy-install.sh && \
    chmod 755 /tmp/tr-control-easy-install.sh && /tmp/tr-control-easy-install.sh auto

EXPOSE 9091 51413 51413/udp

VOLUME ["/transmission/download"]

CMD [ "/usr/bin/transmission-daemon", "-f", "--allowed", "*.*.*.*", "-g", "/", "--download-dir", "/transmission/download", "-c", "/transmission/watch" ]
