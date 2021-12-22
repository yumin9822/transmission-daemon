FROM alpine:latest
MAINTAINER yumin9822 <yumin9822@gmail.com>

RUN apk update && apk add \
	transmission-daemon \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /{download,watch,config} \
	&& chmod -R 777 /{download,watch,config}

COPY install-tr-control.sh /tmp
RUN chmod a+x /tmp/install-tr-control.sh && sh /tmp/install-tr-control.sh /usr/share/transmission

EXPOSE 9091 51413 51413/udp

VOLUME [ "/config", "/downloads", "/watch" ]

CMD [ "/usr/bin/transmission-daemon", "-f", "--allowed", "*.*.*.*", "--config-dir", "/config", "--download-dir", "/download", "--watch-dir", "/watch" ]
