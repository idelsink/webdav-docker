FROM alpine:latest
MAINTAINER Ingmar Delsink https://github.com/idelsink
LABEL version="1.0.0" \
      description="WebDAV docker image using Linux Alpine"

ENV APACHE_WEB_ROOT=/var/www/localhost \
    APACHE_PID_FILE=/run/apache2/httpd.pid \
    # The UID of the Apache user (will be set on first run)
    APACHE_UID= \
    APACHE_USER=apache \
    # The GUI of the Apache user (will be set on first run)
    APACHE_GID= \
    # Optional extra GID to add to the Apache user
    APACHE_OPT_GID= \
    APACHE_GROUP=apache \
    APACHE_WEBDAV_ROOT=/webdav \
    APACHE_WEBDAV_AUTH=/etc/apache2/webdav.password

RUN apk --no-cache update && \
    apk add --no-cache \
        apache2-utils \
        apache2-webdav \
        shadow

WORKDIR /

ADD root /

RUN /scripts/configure.sh

#    80: http
#   443: https
EXPOSE 80 443

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
