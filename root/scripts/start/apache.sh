#!/usr/bin/env sh
# Start the apache2 web server

# delete PID file on exit
trap "{ rm -f ${APACHE_PIDF}; exit 255; }" INT TERM

httpd "${@}"
