#!/bin/bash

echo "Starting Redis..."
/usr/bin/redis-server /home/container/redis/redis.conf

echo "Starting PHP-FPM..."
/usr/sbin/php-fpm8.0 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Apache2..."
apachectl start -f /home/container/apache2/apache2.conf -D /home/container/webroot/

echo "Starting Nginx..."
/usr/local/bin/nginx -t -c /home/container/nginx/nginx.conf
/usr/local/bin/nginx -c /home/container/nginx/nginx.conf
