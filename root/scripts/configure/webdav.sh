#!/usr/bin/env sh

# generate webdav file
cat << EOF > "${APACHE_CONFD}/001-webdav.conf"
Listen 80
<VirtualHost _default_:*>
    DocumentRoot ${APACHE_WEBDAV_ROOT}
    <Directory ${APACHE_WEBDAV_ROOT}>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    <Location />
        DAV On
        AuthType Basic
        AuthName "webdav"
        AuthUserFile ${APACHE_WEBDAV_AUTH}
        Require valid-user
    </Location>
</VirtualHost>
EOF

mkdir -p "${APACHE_WEBDAV_ROOT}"
htpasswd -cb "${APACHE_WEBDAV_AUTH}" "${USERNAME:-}" "${PASSWORD:-}"
chown root:www-data "${APACHE_WEBDAV_AUTH}"
chmod 640 "${APACHE_WEBDAV_AUTH}"
