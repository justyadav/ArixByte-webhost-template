#!/bin/ash

cd /home/container || exit 1

echo "======================================"
echo "     ArixByte Web Hosting"
echo "======================================"

echo "⏳ Preparing folders..."

mkdir -p /home/container/logs
mkdir -p /home/container/tmp


echo "⏳ Starting Web Services..."


# Use container default startup
/usr/local/bin/start.sh
