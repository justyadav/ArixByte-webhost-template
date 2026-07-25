#!/bin/ash

cd /home/container || exit 1

echo "======================================"
echo "     ArixByte Web Hosting"
echo "======================================"


# Create writable folders

mkdir -p /home/container/logs/nginx
mkdir -p /home/container/logs/php
mkdir -p /home/container/tmp/nginx/client_body
mkdir -p /home/container/tmp/nginx/proxy
mkdir -p /home/container/tmp/nginx/fastcgi



echo "⏳ Cleaning temporary files..."

rm -rf /tmp/*



# PHP-FPM

echo "⏳ Starting PHP-FPM..."


php-fpm84 \
-g /home/container/logs/php/php-fpm.pid \
-y /home/container/php-fpm/php-fpm.conf \
-D


sleep 2


echo "✅ PHP-FPM started successfully"



# Nginx

echo "⏳ Starting Nginx..."


nginx \
-p /home/container/nginx \
-c /home/container/nginx/nginx.conf \
-g "daemon off;"


