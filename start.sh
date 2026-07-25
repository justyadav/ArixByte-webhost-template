#!/bin/ash

cd /mnt/server

echo "⏳ Cleaning temporary files..."
rm -rf /tmp/*

echo "⏳ Starting PHP-FPM..."

php-fpm -D

sleep 2

echo "✅ PHP-FPM started successfully."

echo "⏳ Starting Nginx..."

nginx -g "daemon off;"
