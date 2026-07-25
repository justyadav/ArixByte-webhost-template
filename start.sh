#!/bin/ash

# ==========================================
# ArixByte Web Hosting Start Script
# Sigma Nginx PHP Container Compatible
# ==========================================


cd /home/container || exit 1


echo "======================================"
echo "     ArixByte Web Hosting"
echo "======================================"


# Create required directories

echo "⏳ Preparing directories..."

mkdir -p /home/container/logs
mkdir -p /home/container/tmp

mkdir -p /var/lib/nginx/logs
mkdir -p /var/lib/nginx/tmp/client_body
mkdir -p /var/lib/nginx/tmp/proxy
mkdir -p /var/lib/nginx/tmp/fastcgi


# Clean temporary files

echo "⏳ Cleaning temporary files..."

rm -rf /tmp/*



# ==========================================
# PHP-FPM
# ==========================================

echo "⏳ Starting PHP-FPM..."


if command -v php-fpm84 >/dev/null 2>&1
then
    php-fpm84 -D

elif command -v php-fpm8 >/dev/null 2>&1
then
    php-fpm8 -D

elif command -v php-fpm >/dev/null 2>&1
then
    php-fpm -D

else
    echo "❌ PHP-FPM binary not found!"
    exit 1
fi


sleep 2


echo "✅ PHP-FPM started successfully"



# ==========================================
# NGINX
# ==========================================

echo "⏳ Starting Nginx..."


nginx -g "daemon off;"
