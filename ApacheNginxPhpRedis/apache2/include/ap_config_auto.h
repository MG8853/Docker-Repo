/* include/ap_config_auto.h.  Generated from ap_config_auto.h.in by configure.  */
/* include/ap_config_auto.h.in.  Generated from configure.in by autoheader.  */

/* SuExec root directory */
/* #undef AP_DOC_ROOT */

/* Enable DTrace probes */
/* #undef AP_ENABLE_DTRACE */

/* Allow modules to run hook after a fatal exception */
/* #undef AP_ENABLE_EXCEPTION_HOOK */

/* Allow IPv4 connections on IPv6 listening sockets */
#define AP_ENABLE_V4_MAPPED 1

/* Minimum allowed GID */
/* #undef AP_GID_MIN */

/* Enable the APR hook probes capability, reading from ap_hook_probes.h */
/* #undef AP_HOOK_PROBES_ENABLED */

/* User allowed to call SuExec */
/* #undef AP_HTTPD_USER */

/* SuExec log file */
/* #undef AP_LOG_EXEC */

/* SuExec log to syslog */
/* #undef AP_LOG_SYSLOG */

/* Listening sockets are non-blocking when there are more than 1 */
#define AP_NONBLOCK_WHEN_MULTI_LISTEN 1

/* safe shell path for SuExec */
/* #undef AP_SAFE_PATH */

/* Enable if suexec is installed with Linux capabilities, not setuid */
/* #undef AP_SUEXEC_CAPABILITIES */

/* umask for suexec'd process */
/* #undef AP_SUEXEC_UMASK */

/* Location of the MIME types config file, relative to the Apache root
   directory */
#define AP_TYPES_CONFIG_FILE "conf/mime.types"

/* Minimum allowed UID */
/* #undef AP_UID_MIN */

/* User subdirectory */
/* #undef AP_USERDIR_SUFFIX */

/* Using autoconf to configure Apache */
#define AP_USING_AUTOCONF 1

/* Define to 1 if you have the `arc4random_buf' function. */
/* #undef HAVE_ARC4RANDOM_BUF */

/* Define to 1 if you have the `bindprocessor' function. */
/* #undef HAVE_BINDPROCESSOR */

/* Define to 1 if you have the <bstring.h> header file. */
/* #undef HAVE_BSTRING_H */

/* Define if curl is available */
#define HAVE_CURL 1

/* Define to 1 if you have the <curl/curl.h> header file. */
#define HAVE_CURL_CURL_H 1

/* Define if distcache support is enabled */
/* #undef HAVE_DISTCACHE */

/* Define to 1 if you have the <distcache/dc_client.h> header file. */
/* #undef HAVE_DISTCACHE_DC_CLIENT_H */

/* Define to 1 if you have the `ENGINE_init' function. */
#define HAVE_ENGINE_INIT 1

/* Define to 1 if you have the `ENGINE_load_builtin_engines' function. */
#define HAVE_ENGINE_LOAD_BUILTIN_ENGINES 1

/* Define to 1 if you have the `epoll_create' function. */
#define HAVE_EPOLL_CREATE 1

/* Define to 1 if you have the `fopen64' function. */
#define HAVE_FOPEN64 1

/* Define to 1 if you have the `getgrnam' function. */
#define HAVE_GETGRNAM 1

/* Define to 1 if you have the `getloadavg' function. */
#define HAVE_GETLOADAVG 1

/* Define to 1 if you have the `getpgid' function. */
#define HAVE_GETPGID 1

/* Define to 1 if you have the `getpwnam' function. */
#define HAVE_GETPWNAM 1

/* Define if you have gettid() */
#define HAVE_GETTID 1

/* Define if struct tm has a tm_gmtoff field */
#define HAVE_GMTOFF 1

/* Define to 1 if you have the <grp.h> header file. */
#define HAVE_GRP_H 1

/* Define to 1 if you have the `initgroups' function. */
#define HAVE_INITGROUPS 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if jansson is available */
#define HAVE_JANSSON 1

/* Define to 1 if you have the `killpg' function. */
#define HAVE_KILLPG 1

/* Define to 1 if you have the `kqueue' function. */
/* #undef HAVE_KQUEUE */

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define if nghttp2 is available */
#define HAVE_NGHTTP2 1

/* Define to 1 if you have the <nghttp2/nghttp2.h> header file. */
#define HAVE_NGHTTP2_NGHTTP2_H 1

/* Define to 1 if you have the
   `nghttp2_session_callbacks_set_on_invalid_header_callback' function. */
#define HAVE_NGHTTP2_SESSION_CALLBACKS_SET_ON_INVALID_HEADER_CALLBACK 1

/* Define to 1 if you have the `nghttp2_session_change_stream_priority'
   function. */
#define HAVE_NGHTTP2_SESSION_CHANGE_STREAM_PRIORITY 1

/* Define to 1 if you have the `nghttp2_session_get_stream_local_window_size'
   function. */
#define HAVE_NGHTTP2_SESSION_GET_STREAM_LOCAL_WINDOW_SIZE 1

/* Define to 1 if you have the `nghttp2_session_server_new2' function. */
#define HAVE_NGHTTP2_SESSION_SERVER_NEW2 1

/* Define to 1 if you have the `nghttp2_stream_get_weight' function. */
#define HAVE_NGHTTP2_STREAM_GET_WEIGHT 1

/* Define if OpenSSL is available */
#define HAVE_OPENSSL 1

/* Define to 1 if you have the <openssl/engine.h> header file. */
#define HAVE_OPENSSL_ENGINE_H 1

/* Define to 1 if you have the `OPENSSL_init_ssl' function. */
#define HAVE_OPENSSL_INIT_SSL 1

/* Detected PCRE2 */
/* #undef HAVE_PCRE2 */

/* Define to 1 if you have the `port_create' function. */
/* #undef HAVE_PORT_CREATE */

/* Define to 1 if you have the `prctl' function. */
#define HAVE_PRCTL 1

/* Define to 1 if you have the <priv.h> header file. */
/* #undef HAVE_PRIV_H */

/* Define to 1 if you have the `pthread_kill' function. */
#define HAVE_PTHREAD_KILL 1

/* Define to 1 if you have the <pwd.h> header file. */
#define HAVE_PWD_H 1

/* Define to 1 if you have the `RAND_egd' function. */
/* #undef HAVE_RAND_EGD */

/* Define if rustls is available */
/* #undef HAVE_RUSTLS */

/* Define to 1 if you have the `setsid' function. */
#define HAVE_SETSID 1

/* Define to 1 if you have the `SSL_CTX_new' function. */
#define HAVE_SSL_CTX_NEW 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `syslog' function. */
#define HAVE_SYSLOG 1

/* Define if systemd is supported */
/* #undef HAVE_SYSTEMD */

/* Define to 1 if you have the <systemd/sd-daemon.h> header file. */
/* #undef HAVE_SYSTEMD_SD_DAEMON_H */

/* Define to 1 if you have the <sys/ipc.h> header file. */
#define HAVE_SYS_IPC_H 1

/* Define to 1 if you have the <sys/loadavg.h> header file. */
/* #undef HAVE_SYS_LOADAVG_H */

/* Define to 1 if you have the <sys/prctl.h> header file. */
#define HAVE_SYS_PRCTL_H 1

/* Define to 1 if you have the <sys/processor.h> header file. */
/* #undef HAVE_SYS_PROCESSOR_H */

/* Define to 1 if you have the <sys/resource.h> header file. */
#define HAVE_SYS_RESOURCE_H 1

/* Define to 1 if you have the <sys/sdt.h> header file. */
/* #undef HAVE_SYS_SDT_H */

/* Define to 1 if you have the <sys/sem.h> header file. */
#define HAVE_SYS_SEM_H 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/times.h> header file. */
#define HAVE_SYS_TIMES_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have <sys/wait.h> that is POSIX.1 compatible. */
#define HAVE_SYS_WAIT_H 1

/* Define to 1 if you have the `timegm' function. */
#define HAVE_TIMEGM 1

/* Define to 1 if you have the `times' function. */
#define HAVE_TIMES 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the `vsyslog' function. */
/* #undef HAVE_VSYSLOG */

/* Root directory of the Apache install area */
#define HTTPD_ROOT "/home/container/apache2"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT ""

/* Define to the full name of this package. */
#define PACKAGE_NAME ""

/* Define to the full name and version of this package. */
#define PACKAGE_STRING ""

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME ""

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION ""

/* Location of the config file, relative to the Apache root directory */
#define SERVER_CONFIG_FILE "conf/httpd.conf"

/* This platform doesn't suffer from the thundering herd problem */
#define SINGLE_LISTEN_UNSERIALIZED_ACCEPT 1

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Path to suexec binary */
/* #undef SUEXEC_BIN */

/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
# define _ALL_SOURCE 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable threading extensions on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# define _TANDEM_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# define __EXTENSIONS__ 1
#endif


/* Define to 1 if on MINIX. */
/* #undef _MINIX */

/* Define to 2 if the system does not provide POSIX.1 features except with
   this defined. */
/* #undef _POSIX_1_SOURCE */

/* Define to 1 if you need to in order for `stat' and other things to work. */
/* #undef _POSIX_SOURCE */

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to 'int' if <sys/resource.h> doesn't define it for us */
/* #undef rlim_t */
