#!/usr/bin/env sh
# Start the apache2 web server

# delete old PID file
if [ -f "${APACHE_PIDF}" ]; then
    rm "${APACHE_PIDF}"
fi

httpd "${@}"
