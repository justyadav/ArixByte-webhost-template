#!/bin/ash

cd /home/container || exit 1

echo "======================================"
echo "        ArixByte Web Hosting"
echo "======================================"

echo "⏳ Cleaning temporary files..."

rm -rf /tmp/*


echo "⏳ Starting PHP-FPM..."

php-fpm -D


sleep 2


echo "✅ PHP-FPM started successfully"


echo "⏳ Starting Nginx..."


nginx -g "daemon off;"
