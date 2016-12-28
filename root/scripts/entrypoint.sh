#!/usr/bin/env sh

echo "~~ Configuring apache"
/scripts/configure/apache.sh
echo "~~ Configuring WebDAV"
/scripts/configure/webdav.sh
echo "~~ Starting apache"
/scripts/start/apache.sh -DFOREGROUND
