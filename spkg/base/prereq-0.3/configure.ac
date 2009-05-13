AC_INIT()
AC_PREREQ(2.3)

AC_PROG_CXX()
AC_PROG_LEX()
AC_PROG_YACC()
AC_CHECK_PROG(GCC,gcc,yes,missing -- the GCC Gnu C compiler)
AC_CHECK_PROG(MAKE,make,yes,missing -- make build tool)
AC_CHECK_PROG(M4,m4,yes,missing -- m4 macro processor)
AC_CHECK_PROG(PERL,perl,yes,missing -- the perl scripting language)

dnl # Checking for Perl version
AC_CHECKING([Perl Version])
changequote(, )dnl
perlcmp=`perl -e 'printf("%d",$] < 5.0008 )'`
perlvers=`perl -e 'printf("%.3f",$])'`
changequote([, ])dnl
AC_MSG_RESULT([Perl Version: $perlvers])
case $perlcmp in
    0* )
        ;;
    * ) echo ""
        echo "Latest Perl found on your system is $perlvers,"
        echo "but at least Perl version 5.8 is required."
        echo ""
        AC_ERROR([Perl version too old])
        ;;
esac

AC_CHECK_PROG(RANLIB,ranlib,yes,missing -- build tool)
AC_CHECK_PROGS(BISON, bison)
AC_CHECK_PROGS(FLEX, flex)

AC_CACHE_CHECK([whether gcc is new enough],
   [tfs_cv_gcc_version],
   [AC_COMPILE_IFELSE(
     [AC_LANG_SOURCE(
       [
       @%:@if (__GNUC__ < 3)
       @%:@ error "doesn't work with gcc < 3.x."
       @%:@endif
      ])],
    [tfs_cv_gcc_version=yes],
    [tfs_cv_gcc_version=no])
    test x$tfs_cv_gcc_version != xyes && AC_MSG_ERROR(
    [please upgrade to gcc 3.x or 4.x])
])
 


AC_OUTPUT(Makefile)


