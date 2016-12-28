FROM alpine:3.4
MAINTAINER Ingmar Delsink https://github.com/idelsink
LABEL version="0.0.1" \
      description="WebDAV docker image using Linux Alpine"

ENV APACHE_WEB_ROOT=/var/www/localhost \
    APACHE_CONF=/etc/apache2/httpd.conf \
    APACHE_CONFD=/etc/apache2/conf.d \
    APACHE_PIDF=/run/apache2/httpd.pid \
    APACHE_RUN=/run/apache2 \
    APACHE_WEBDAV_ROOT=/webdav \
    APACHE_WEBDAV_AUTH=/etc/apache2/webdav.password

RUN apk --no-cache update && \
    apk add --no-cache \
        apache2-utils \
        apache2-webdav

ADD root /

RUN /scripts/configure/apache.sh

WORKDIR /

EXPOSE 80 443

ENTRYPOINT /scripts/entrypoint.sh
