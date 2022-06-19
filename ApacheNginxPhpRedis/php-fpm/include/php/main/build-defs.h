/*
   +----------------------------------------------------------------------+
   | Copyright (c) The PHP Group                                          |
   +----------------------------------------------------------------------+
   | This source file is subject to version 3.01 of the PHP license,      |
   | that is bundled with this package in the file LICENSE, and is        |
   | available through the world-wide-web at the following url:           |
   | http://www.php.net/license/3_01.txt                                  |
   | If you did not receive a copy of the PHP license and are unable to   |
   | obtain it through the world-wide-web, please send a note to          |
   | license@php.net so we can mail you a copy immediately.               |
   +----------------------------------------------------------------------+
   | Author: Stig Sæther Bakken <ssb@php.net>                             |
   +----------------------------------------------------------------------+
*/

#define CONFIGURE_COMMAND " './configure'  '--prefix=/home/container/php-fpm' '--with-apxs2=/home/container/apache2/bin/apxs' '--with-curl' '--with-openssl' '--enable-soap' '--enable-gd' '--with-zip' '--with-jpeg' '--with-freetype' '--with-ldap' '--with-expat' '--enable-intl' '--with-xsl' '--with-zlib' '--with-mysqli' '--enable-mbstring' '--enable-fpm' '--with-fpm-user=container' '--with-fpm-group=container'"
#define PHP_ODBC_CFLAGS	""
#define PHP_ODBC_LFLAGS		""
#define PHP_ODBC_LIBS		""
#define PHP_ODBC_TYPE		""
#define PHP_OCI8_DIR			""
#define PHP_OCI8_ORACLE_VERSION		""
#define PHP_PROG_SENDMAIL	"/usr/sbin/sendmail"
#define PEAR_INSTALLDIR         ""
#define PHP_INCLUDE_PATH	".:"
#define PHP_EXTENSION_DIR       "/home/container/php-fpm/lib/php/extensions/no-debug-zts-20200930"
#define PHP_PREFIX              "/home/container/php-fpm"
#define PHP_BINDIR              "/home/container/php-fpm/bin"
#define PHP_SBINDIR             "/home/container/php-fpm/sbin"
#define PHP_MANDIR              "/home/container/php-fpm/php/man"
#define PHP_LIBDIR              "/home/container/php-fpm/lib/php"
#define PHP_DATADIR             "/home/container/php-fpm/share/php"
#define PHP_SYSCONFDIR          "/home/container/php-fpm/etc"
#define PHP_LOCALSTATEDIR       "/home/container/php-fpm/var"
#define PHP_CONFIG_FILE_PATH    "/home/container/php-fpm/lib"
#define PHP_CONFIG_FILE_SCAN_DIR    ""
#define PHP_SHLIB_SUFFIX        "so"
#define PHP_SHLIB_EXT_PREFIX    ""
