PHP_ARG_ENABLE(xhprof, whether to enable xhprof support,
[ --enable-xhprof      Enable xhprof support])

if test "$PHP_XHPROF" != "no"; then

  AC_MSG_CHECKING([for PCRE includes])

  if test -f $phpincludedir/ext/pcre/php_pcre.h; then
    AC_DEFINE([HAVE_PCRE], 1, [have pcre headers])
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
  fi

  ifdef([PHP_ADD_EXTENSION_DEP],
  [
    PHP_ADD_EXTENSION_DEP(xhprof, json, true)
  ])

  PHP_NEW_EXTENSION(xhprof, xhprof.c, $ext_shared)
fi
