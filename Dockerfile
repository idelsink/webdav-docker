FROM alpine:latest
MAINTAINER Ingmar Delsink https://github.com/idelsink
LABEL version="1.0.1" \
      description="WebDAV docker image using Linux Alpine"

ENV APACHE_WEB_ROOT=/var/www/localhost \
    APACHE_PID_FILE=/run/apache2/httpd.pid \
    APACHE_USER=apache \
    APACHE_GROUP=apache \
    APACHE_WEBDAV_ROOT=/webdav \
    APACHE_WEBDAV_AUTH=/etc/apache2/webdav.password

RUN apk --no-cache update && \
    apk add --no-cache \
        apache2-utils \
        apache2-webdav

WORKDIR /

ADD root /

RUN /scripts/configure.sh

#    80: http
#   443: https
EXPOSE 80 443

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
