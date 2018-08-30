FROM alpine:latest

MAINTAINER leozhang2018 <leozhang2018@gmail.com>

RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd\
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng \
	&& wget --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/0.5.0/AriaNg-0.5.0.zip \
	&& unzip AriaNg-0.5.0.zip -d aria-ng \
	&& rm -rf AriaNg-0.5.0.zip

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80

CMD ["/aria2/init.sh"]
