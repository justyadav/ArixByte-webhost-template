#!/bin/ash

cd /home/container || exit 1

echo "======================================"
echo "     ArixByte Web Hosting"
echo "======================================"

echo "⏳ Preparing folders..."

mkdir -p /home/container/logs
mkdir -p /home/container/tmp


echo "⏳ Starting PHP-FPM..."

# Find PHP-FPM automatically

PHPFPM=$(find /usr -name "php-fpm*" -type f 2>/dev/null | head -n 1)


if [ -z "$PHPFPM" ]; then
    echo "❌ PHP-FPM binary not found"
    exit 1
fi


echo "Using PHP-FPM: $PHPFPM"

$PHPFPM -D



sleep 2


echo "✅ PHP-FPM started successfully"


echo "⏳ Starting Nginx..."


nginx \
-g "error_log /home/container/logs/nginx-error.log;" \
-g "pid /home/container/tmp/nginx.pid;" \
-g "daemon off;"
