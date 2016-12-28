#!/usr/bin/env sh

echo "~~ Configuring WebDAV"
/scripts/configure/webdav.sh
echo "~~ Starting apache"
/scripts/start/apache.sh -DFOREGROUND
