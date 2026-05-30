#!/bin/bash
set -euo pipefail

openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /tmp/selfsigned.key \
    -out /tmp/selfsigned.crt \
    -days 365 \
    -subj "/CN=localhost" 2>/dev/null

cat << 'EOF' > /tmp/nginx.conf
events {}

http {
    # Keep error logs in /tmp to avoid requiring root/sudo
    error_log /tmp/nginx_error.log;
    access_log /tmp/nginx_access.log;
    client_body_temp_path /tmp/client_body;
    fastcgi_temp_path /tmp/fastcgi_temp;
    proxy_temp_path /tmp/proxy_temp;
    scgi_temp_path /tmp/scgi_temp;
    uwsgi_temp_path /tmp/uwsgi_temp;

    server {
        # Listen on 8443 with SSL enabled
        listen 8443 ssl;
        server_name localhost;

        # Point to the newly generated cert and key
        ssl_certificate /tmp/selfsigned.crt;
        ssl_certificate_key /tmp/selfsigned.key;

        location / {
            return 200 "HTTPS is working on 8443!\n";
        }
    }
}
EOF

nginx -c /tmp/nginx.conf