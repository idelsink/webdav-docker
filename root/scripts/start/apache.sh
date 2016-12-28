#!/usr/bin/env sh
# Start the apache2 web server

# delete old PID file
rm -f ${APACHE_PIDF}

httpd "${@}"
