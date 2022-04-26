#!/bin/bash

echo "Starting Redis..."
/usr/bin/redis-server /home/container/redis/redis.conf

echo "Starting PHP-FPM..."
/usr/sbin/php-fpm8.0 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Nginx..."
/usr/local/bin/nginx -c /home/container/nginx/nginx.conf
