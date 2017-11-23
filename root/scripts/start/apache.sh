#!/usr/bin/env sh
# Start the apache2 web server

# delete PID file
rm -f "${APACHE_PID_FILE}"

httpd "${@}"
