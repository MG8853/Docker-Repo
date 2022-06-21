#!/bin/bash

echo -e "--------------------------------------------"
echo "Starting Redis..."
/usr/bin/redis-server /home/container/redis/redis.conf

echo -e "--------------------------------------------"
echo "Starting PHP-FPM..."
/home/container/php-fpm/sbin/php-fpm --fpm-config /home/container/php-fpm/etc/php-fpm.conf --daemonize

echo -e "--------------------------------------------"
echo "Starting Apache2..."
rm -fr /home/container/apache2/run/apache2/apache2.pid
/home/container/apache2/bin/apachectl configtest -f /home/container/apache2/conf/httpd.conf
/home/container/apache2/bin/apachectl -f /home/container/apache2/conf/httpd.conf

echo -e "--------------------------------------------"
echo "Starting Nginx..."
/usr/local/bin/nginx -t -c /home/container/nginx/nginx.conf
/usr/local/bin/nginx -c /home/container/nginx/nginx.conf