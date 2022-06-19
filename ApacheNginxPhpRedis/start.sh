#!/bin/bash

echo -e "--------------------------------------------"
echo "Starting Redis..."
/usr/bin/redis-server /home/container/redis/redis.conf

echo -e "--------------------------------------------"
echo "Starting PHP-FPM..."
/usr/sbin/php-fpm8.0 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo -e "--------------------------------------------"
echo "Starting Apache2..."
rm -fr /home/container/apache2/run/apache2/apache2.pid
# this won't be correct after changing uid
unset HOME

# for supporting multiple apache2 instances
if [ "${APACHE_CONFDIR##/home/container/apache2-}" != "${APACHE_CONFDIR}" ] ; then
	SUFFIX="-${APACHE_CONFDIR##/home/container/apache2-}"
else
	SUFFIX=
fi

# Since there is no sane way to get the parsed apache2 config in scripts, some
# settings are defined via environment variables and then used in apache2ctl,
# /home/container/init.d/apache2, /home/container/logrotate.d/apache2, etc.
export APACHE_RUN_USER=container
export APACHE_RUN_GROUP=container
# temporary state file location. This might be changed to /run in Wheezy+1
export APACHE_PID_FILE=/home/container/apache2/run/apache2$SUFFIX/apache2.pid
export APACHE_RUN_DIR=/home/container/apache2/run/apache2$SUFFIX
export APACHE_LOCK_DIR=/home/container/apache2/lock/apache2$SUFFIX
# Only /home/container/apache2/log/apache2 is handled by /home/container/logrotate.d/apache2.
export APACHE_LOG_DIR=/home/container/apache2/log/apache2$SUFFIX

## The locale used by some modules like mod_dav
export LANG=C
## Uncomment the following line to use the system default locale instead:
#. /home/container/default/locale
export LANG
/usr/local/apache2/bin/apachectl configtest -f /home/container/apache2/apache2.conf
/usr/local/apache2/bin/apachectl -f /home/container/apache2/apache2.conf

echo -e "--------------------------------------------"
echo "Starting Nginx..."
/usr/local/bin/nginx -t -c /home/container/nginx/nginx.conf
/usr/local/bin/nginx -c /home/container/nginx/nginx.conf
