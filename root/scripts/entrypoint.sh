#!/usr/bin/env sh

# Configuring system if not yet configured
FIRST_TIME_SETUP_DONE=/var/webdav-docker/first-time-setup
if [ ! -f "${FIRST_TIME_SETUP_DONE}" ]; then
    /scripts/first-time-setup.sh && \
    mkdir -p "${FIRST_TIME_SETUP_DONE%/*}" && touch "${FIRST_TIME_SETUP_DONE}"
fi

# Set timezone
if [ -n "${TIMEZONE}" ]; then
    if [ -f /usr/share/zoneinfo/${TIMEZONE} ]; then
        echo "~~ Setting timezone to ${TIMEZONE} ~~"
        ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
    else
        echo "~~ Timezone '${TIMEZONE}' not found in /usr/share/zoneinfo/[[[]][]] ~~"
    fi
fi

echo "~~ Container date output: $(date) ~~"

echo "~~ Starting apache"
/scripts/start/apache.sh -DFOREGROUND
