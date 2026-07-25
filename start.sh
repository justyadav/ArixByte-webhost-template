#!/bin/ash

cd /home/container || exit 1

echo "⏳ Cleaning temporary files..."

rm -rf /tmp/*


echo "⏳ Preparing directories..."

mkdir -p /home/container/logs
mkdir -p /var/lib/nginx/tmp/client_body
mkdir -p /var/lib/nginx/tmp/proxy
mkdir -p /var/lib/nginx/logs


echo "⏳ Starting PHP-FPM..."

php-fpm84 -D || php-fpm8 -D || php-fpm -D


sleep 2

echo "✅ PHP-FPM started successfully."


echo "⏳ Starting Nginx..."


nginx -g "daemon off;"
