FROM alpine:latest
MAINTAINER yumin9822 <yumin9822@gmail.com>

RUN apk update && apk add \
	transmission-daemon \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /transmission/{download,watch} \
	&& chmod -R 777 /transmission

RUN mkdir /config && chmod -R 777 /config

COPY install-tr-control.sh /tmp
RUN chmod a+x /tmp/install-tr-control.sh && sh /tmp/install-tr-control.sh /usr/share/transmission

EXPOSE 9091 51413 51413/udp

VOLUME ["/transmission/download"]

CMD [ "/usr/bin/transmission-daemon", "-f", "--allowed", "*.*.*.*", "--config-dir", "/config", "--download-dir", "/transmission/download", "--watch-dir", "/transmission/watch" ]
