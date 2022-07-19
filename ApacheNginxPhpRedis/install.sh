#!/bin/bash



apt-get update && apt-get -y upgrade && \
    apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget
add-apt-repository -y ppa:ondrej/php && add-apt-repository -y ppa:chris-lea/redis-server
apt-get update && \
    apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev redis-server
apt-get -y install autoconf dpkg-dev file g++ gcc libc-dev make pkg-config re2c xz-utils gnupg dirmngr
apt-get -y install libargon2-dev libcurl4-openssl-dev libonig-dev libreadline-dev libsodium-dev libsqlite3-dev \
    libssl-dev libxml2-dev zlib1g-dev
apt-get -y install libaprutil1-ldap libldap-common
apt-get -y install bzip2 dirmngr dpkg-dev gcc gnupg libapr1-dev libaprutil1-dev libbrotli-dev libcurl4-openssl-dev \
    libjansson-dev liblua5.2-dev libnghttp2-dev libpcre3-dev libssl-dev libxml2-dev make wget zlib1g-dev libxslt-dev \
    libzip-dev
apt-get -y install libmagickwand-dev





echo "Build Apache2..."
HTTPD_PREFIX=/home/container/apache2
PATH=$HTTPD_PREFIX/bin:$PATH
mkdir -p "$HTTPD_PREFIX" && chown container:container "$HTTPD_PREFIX"
WORKDIR=$HTTPD_PREFIX
mkdir /home/container/apache2
cd /home/container/apache2

set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		libaprutil1-ldap \
		libldap-common \
	; \
	rm -rf /var/lib/apt/lists/*

HTTPD_VERSION=2.4.54
HTTPD_SHA256=eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340

HTTPD_PATCHES=""

set -eux; \
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		bzip2 \
		dirmngr \
		dpkg-dev \
		gcc \
		gnupg \
		libapr1-dev \
		libaprutil1-dev \
		libbrotli-dev \
		libcurl4-openssl-dev \
		libjansson-dev \
		liblua5.2-dev \
		libnghttp2-dev \
		libpcre3-dev \
		libssl-dev \
		libxml2-dev \
		make \
		wget \
		zlib1g-dev \
	; \
	rm -r /var/lib/apt/lists/*; \
	\
	ddist() { \
		local f="$1"; shift; \
		local distFile="$1"; shift; \
		local success=; \
		local distUrl=; \
		for distUrl in \
			'https://www.apache.org/dyn/closer.cgi?action=download&filename=' \
			https://downloads.apache.org/ \
			https://www-us.apache.org/dist/ \
			https://www.apache.org/dist/ \
			https://archive.apache.org/dist/ \
		; do \
			if wget -O "$f" "$distUrl$distFile" && [ -s "$f" ]; then \
				success=1; \
				break; \
			fi; \
		done; \
		[ -n "$success" ]; \
	}; \
	\
	ddist 'httpd.tar.bz2' "httpd/httpd-$HTTPD_VERSION.tar.bz2"; \
	echo "$HTTPD_SHA256 *httpd.tar.bz2" | sha256sum -c -; \
	\
	ddist 'httpd.tar.bz2.asc' "httpd/httpd-$HTTPD_VERSION.tar.bz2.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	for key in \
		DE29FB3971E71543FD2DC049508EAEC5302DA568 \
		13155B0E9E634F42BF6C163FDDBA64BA2C312D2F \
		8B39757B1D8A994DF2433ED58B3A601F08C975E5 \
		31EE1A81B8D066548156D37B7D6DBFD1F08E012A \
		A10208FEC3152DD7C0C9B59B361522D782AB7BD1 \
		3DE024AFDA7A4B15CB6C14410F81AA8AB0D5F771 \
		EB138C6AF0FC691001B16D93344A844D751D7F27 \
		CBA5A7C21EC143314C41393E5B968010E04F9A89 \
		3C016F2B764621BB549C66B516A96495E2226795 \
		937FB3994A242BA9BF49E93021454AF0CC8B0F7E \
		EAD1359A4C0F2D37472AAF28F55DF0293A4E7AC9 \
		4C1EADADB4EF5007579C919C6635B6C0DE885DD3 \
		01E475360FCCF1D0F24B9D145D414AE1E005C9CB \
		92CCEF0AA7DD46AC3A0F498BCA6939748103A37E \
		D395C7573A68B9796D38C258153FA0CD75A67692 \
		FA39B617B61493FD283503E7EED1EA392261D073 \
		984FB3350C1D5C7A3282255BB31B213D208F5064 \
		FE7A49DAA875E890B4167F76CCB2EB46E76CF6D0 \
		39F6691A0ECF0C50E8BB849CF78875F642721F00 \
		29A2BA848177B73878277FA475CAA2A3F39B3750 \
		120A8667241AEDD4A78B46104C042818311A3DE5 \
		453510BDA6C5855624E009236D0BC73A40581837 \
		0DE5C55C6BF3B2352DABB89E13249B4FEC88A0BF \
		7CDBED100806552182F98844E8E7E00B4DAA1988 \
		A8BA9617EF3BCCAC3B29B869EDB105896F9522D8 \
		3E6AC004854F3A7F03566B592FF06894E55B0D0E \
		5B5181C2C0AB13E59DA3F7A3EC582EB639FF092C \
		A93D62ECC3C8EA12DB220EC934EA76E6791485A8 \
		65B2D44FE74BD5E3DE3AC3F082781DE46D5954FA \
		8935926745E1CE7E3ED748F6EC99EE267EB5F61A \
		E3480043595621FE56105F112AB12A7ADC55C003 \
		93525CFCF6FDFFB3FD9700DD5A4B10AE43B56A27 \
		C55AB7B9139EB2263CD1AABC19B033D1760C227B \
		26F51EF9A82F4ACB43F1903ED377C9E7D1944C66 \
	; do \
		gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
	done; \
	gpg --batch --verify httpd.tar.bz2.asc httpd.tar.bz2; \
	command -v gpgconf && gpgconf --kill all || :; \
	rm -rf "$GNUPGHOME" httpd.tar.bz2.asc; \
	\
	mkdir -p src; \
	tar -xf httpd.tar.bz2 -C src --strip-components=1; \
	rm httpd.tar.bz2; \
	cd src; \
	\
	patches() { \
		while [ "$#" -gt 0 ]; do \
			local patchFile="$1"; shift; \
			local patchSha256="$1"; shift; \
			ddist "$patchFile" "httpd/patches/apply_to_$HTTPD_VERSION/$patchFile"; \
			echo "$patchSha256 *$patchFile" | sha256sum -c -; \
			patch -p0 < "$patchFile"; \
			rm -f "$patchFile"; \
		done; \
	}; \
	patches $HTTPD_PATCHES; \
	\
	gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"; \
	CFLAGS="$(dpkg-buildflags --get CFLAGS)"; \
	CPPFLAGS="$(dpkg-buildflags --get CPPFLAGS)"; \
	LDFLAGS="$(dpkg-buildflags --get LDFLAGS)"; \
	./configure \
		--build="$gnuArch" \
		--prefix="$HTTPD_PREFIX" \
		--enable-mods-shared=reallyall \
		--enable-mpms-shared=all \
		--enable-pie \
		--enable-so \
		CFLAGS="-pipe $CFLAGS" \
		CPPFLAGS="$CPPFLAGS" \
		LDFLAGS="-Wl,--as-needed $LDFLAGS" \
	; \
	make -j "$(nproc)"; \
	make install; \
	\
	cd ..; \
	rm -r src man manual; \
	\
	sed -ri \
		-e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
		-e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
		-e 's!^(\s*TransferLog)\s+\S+!\1 /proc/self/fd/1!g' \
		-e 's!^(\s*User)\s+daemon\s*$!\1 container!g' \
		-e 's!^(\s*Group)\s+daemon\s*$!\1 container!g' \
		"$HTTPD_PREFIX/conf/httpd.conf" \
		"$HTTPD_PREFIX/conf/extra/httpd-ssl.conf" \
	; \
	grep -E '^\s*User container$' "$HTTPD_PREFIX/conf/httpd.conf"; \
	grep -E '^\s*Group container$' "$HTTPD_PREFIX/conf/httpd.conf"; \
	\
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; \
	find /usr/local -type f -executable -exec ldd '{}' ';' \
		| awk '/=>/ { print $(NF-1) }' \
		| sort -u \
		| xargs -r dpkg-query --search \
		| cut -d: -f1 \
		| sort -u \
		| xargs -r apt-mark manual \
	; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	\
	httpd -v






apt-get update && \
apt-get install -y autoconf \
    dpkg-dev \
    file \
    g++ \
    gcc \
    libc-dev \
    make \
    pkg-config \
    re2c \
    ca-certificates \
    curl \
    xz-utils \
    gnupg \
    dirmngr && \
apt-get update && \
apt-get install -y libargon2-dev \
    libcurl4-openssl-dev \
    libonig-dev \
    libreadline-dev \
    libsodium-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev && \
apt-get update && \
apt-get install -y libpng-dev \
    libjpeg-dev \
    zlib1g-dev \
    libxslt1-dev \
    libzip-dev \
    libexpat1 \
    libapr1-dev \
    libaprutil1-dev










echo "Starting PHP-FPM..."
cd /home/container/
wget https://www.php.net/distributions/php-8.0.20.tar.gz && tar xzvf php-8.0.20.tar.gz && \
    mv php-8.0.20 php-fpm && cd php-fpm && \
    ./configure   \
    --prefix=/home/container/php-fpm   \
    --with-apxs2=/home/container/apache2/bin/apxs   \
    --with-pdo-mysql   \
    --enable-mbstring   \
    --with-zip   \
    --enable-fpm   \
    --enable-gd   \
    --with-curl   \
    --with-openssl   \
    --enable-soap   \
    --with-jpeg   \
    --with-mysqli   \
    --enable-intl   \
    --with-expat   \
    --with-xsl   \
    --with-zlib   \
    --with-password-argon2   \
    --with-iconv   \
    --with-readline   \
    --with-fpm-user=container   \
    --with-fpm-group=container && \
    make -j 2 && make install
rm -fr "/home/container/php-8.0.20.tar.gz"



echo "Build APR..."
cd /home/container/
wget https://dlcdn.apache.org//apr/apr-1.7.0.tar.gz && tar xvzf apr-1.7.0.tar.gz && cd apr-1.7.0 && \
    ./configure && \
    make && make install
rm -fr "/home/container/apr-1.7.0.tar.gz"
cd /home/container/
apt-get update && apt-get install -y expat
apt-get update && apt-get install -y libexpat1-dev
wget https://dlcdn.apache.org//apr/apr-util-1.6.1.tar.gz && tar xvzf apr-util-1.6.1.tar.gz && cd apr-util-1.6.1 && \
    ./configure --with-apr=/usr/local/apr/bin/apr-1-config && \
    make && make install
rm -fr "/home/container/apr-util-1.6.1.tar.gz"


echo "Build PHP-FPM ImageMagick..."
cd /home/container/
wget https://pecl.php.net/get/imagick-3.7.0.tgz && tar xvzf imagick-3.7.0.tgz && cd imagick-3.7.0 && \
    "/home/container/php-fpm/bin/phpize" && \
    ./configure   \
    --with-imagick=/home/container/php-fpm   \
    --with-php-config=/home/container/php-fpm/bin/php-config && \
    make && make install
rm -fr "/home/container/imagick-3.7.0.tgz"



echo "Build PHP-FPM Memcache..."
cd /home/container/
wget https://pecl.php.net/get/memcache-8.0.tgz && tar xvzf memcache-8.0.tgz && cd memcache-8.0 && \
    "/home/container/php-fpm/bin/phpize" && \
    ./configure   \
    --enable-memcache=/home/container/php-fpm   \
    --with-php-config=/home/container/php-fpm/bin/php-config && \
    make && make install
rm -fr "/home/container/memcache-8.0.tgz"

echo "Build PHP-FPM Zlib..."
cd /home/container/php-8.0.20/ext/zlib/ && \
    mv "/home/container/php-8.0.20/ext/zlib/config0.m4" "/home/container/php-8.0.20/ext/zlib/config.m4" && \
    "/home/container/php-fpm/bin/phpize" && \
    ./configure   \
    --with-zlib=/home/container/php-fpm   \
    --with-php-config=/home/container/php-fpm/bin/php-config && \
    make && make install

echo "Build PHP-FPM pdo..."
cd /home/container/php-8.0.20/ext/pdo/ && \
    "/home/container/php-fpm/bin/phpize" && \
    ./configure   \
    --with-pdo=/home/container/php-fpm   \
    --with-php-config=/home/container/php-fpm/bin/php-config && \
    make && make install

echo "Build PHP-FPM pdo_mysql..."
cd /home/container/php-8.0.20/ext/pdo_mysql/ && \
    "/home/container/php-fpm/bin/phpize" && \
    ./configure   \
    --with-pdo_mysql=/home/container/php-fpm   \
    --with-php-config=/home/container/php-fpm/bin/php-config && \
    make && make install

echo "Build PHP-FPM mysqlnd..."
cd /home/container/php-8.0.20/ext/mysqlnd/ && \
    mv "/home/container/php-8.0.20/ext/mysqlnd/config9.m4" "/home/container/php-8.0.20/ext/mysqlnd/config.m4" && \
    "/home/container/php-fpm/bin/phpize" && \
    ./configure   \
    --with-mysqlnd=/home/container/php-fpm   \
    --with-php-config=/home/container/php-fpm/bin/php-config && \
    make && make install



echo "Setup PHP-FPM..."
cp "/home/container/php-fpm/php.ini-development" "/home/container/php-fpm/php.ini"
cp "/home/container/php-fpm/etc/php-fpm.conf.default" "/home/container/php-fpm/etc/php-fpm.conf"
cp "/home/container/php-fpm/etc/php-fpm.d/www.conf.default" "/home/container/php-fpm/etc/php-fpm.d/www.conf"
mkdir /home/container/php-fpm/log



