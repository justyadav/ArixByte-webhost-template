#!/bin/ash

cd /home/container || exit 1

echo "======================================"
echo "     ArixByte Web Hosting"
echo "======================================"

echo "⏳ Preparing folders..."

mkdir -p /home/container/logs
mkdir -p /home/container/logs/nginx
mkdir -p /home/container/logs/php
mkdir -p /home/container/tmp
mkdir -p /home/container/tmp/nginx/client_body
mkdir -p /home/container/tmp/nginx/proxy
mkdir -p /home/container/tmp/nginx/fastcgi


echo "⏳ Configuring PHP-FPM..."

cat > /home/container/php-fpm.conf <<EOF
[global]

error_log = /home/container/logs/php/php-fpm.log

daemonize = no

include=/etc/php84/php-fpm.d/*.conf
EOF


echo "⏳ Starting PHP-FPM..."

php-fpm8 \
-y /home/container/php-fpm.conf \
-D


sleep 2


echo "✅ PHP-FPM started successfully"


echo "⏳ Configuring Nginx..."


cat > /home/container/nginx.conf <<EOF

worker_processes auto;

error_log /home/container/logs/nginx/error.log;

pid /home/container/tmp/nginx.pid;


events {
    worker_connections 1024;
}


http {

    include /etc/nginx/mime.types;

    default_type application/octet-stream;


    access_log /home/container/logs/nginx/access.log;


    client_body_temp_path /home/container/tmp/nginx/client_body;

    proxy_temp_path /home/container/tmp/nginx/proxy;

    fastcgi_temp_path /home/container/tmp/nginx/fastcgi;


    include /etc/nginx/http.d/*.conf;

}

EOF



echo "⏳ Starting Nginx..."


nginx \
-c /home/container/nginx.conf \
-g "daemon off;"
