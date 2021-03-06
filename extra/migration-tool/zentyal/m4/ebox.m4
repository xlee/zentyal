AC_DEFUN([AC_CONF_EBOX],
#
# Handle user hints
#
[
  real_test=$1

  if test "x$real_test" = "xyes" ; then
	  AC_MSG_CHECKING(conf path)
	  CONFPATH=`perl -MEBox::Config -e 'print EBox::Config->conf'`
  else
          CONFPATH=$LOCALSTATEDIR/lib/zentyal/conf
  fi
  AC_SUBST(CONFPATH)
  AC_MSG_RESULT($CONFPATH)
  
  if test "x$real_test" = "xyes" ; then
	AC_MSG_CHECKING(stubs path)
	STUBSPATH=`perl -MEBox::Config -e 'print EBox::Config->stubs'`

	AC_MSG_CHECKING(cgi path)
	CGIPATH=`perl -MEBox::Config -e 'print EBox::Config->cgi'`

	AC_MSG_CHECKING(templates path)
	TEMPLATESPATH=`perl -MEBox::Config -e 'print EBox::Config->templates'`

	AC_MSG_CHECKING(schemas path)
	SCHEMASPATH=`perl -MEBox::Config -e 'print EBox::Config->schemas'`

	AC_MSG_CHECKING(www path)
	WWWPATH=`perl -MEBox::Config -e 'print EBox::Config->www'`
	if test -z "$CGIPATH"; then
	AC_MSG_ERROR("zentyal www path not found")
	fi
	AC_SUBST(WWWPATH)
	AC_MSG_RESULT($WWWPATH)

	AC_MSG_CHECKING(css path)
	CSSPATH=`perl -MEBox::Config -e 'print EBox::Config->css'`

	AC_MSG_CHECKING(images path)
	IMAGESPATH=`perl -MEBox::Config -e 'print EBox::Config->images'`
  else
    STUBSPATH=$DATADIR/zentyal/stubs
    CGIPATH=$DATADIR/zentyal/cgi
    TEMPLATESPATH=$DATADIR/zentyal/templates
    SCHEMASPATH=$DATADIR/zentyal/schemas
    WWWPATH=$DATADIR/zentyal/www
    CSSPATH=$DATADIR/zentyal/www/css
    IMAGESPATH=$DATADIR/zentyal/www/images
  fi

  if test -z "$STUBSPATH"; then
	AC_MSG_ERROR("stubs path not found")
  fi
  AC_SUBST(STUBSPATH)
  AC_MSG_RESULT($STUBSPATH)

  if test -z "$CGIPATH"; then
    AC_MSG_ERROR("zentyal cgi path not found")
  fi
  AC_SUBST(CGIPATH)
  AC_MSG_RESULT($CGIPATH)

  if test -z "$CGIPATH"; then
    AC_MSG_ERROR("zentyal template path not found")
  fi
  AC_SUBST(TEMPLATESPATH)
  AC_MSG_RESULT($TEMPLATESPATH)

  if test -z "$CGIPATH"; then
    AC_MSG_ERROR("zentyal schemas path not found")
  fi
  AC_SUBST(SCHEMASPATH)
  AC_MSG_RESULT($SCHEMASPATH)

  if test -z "$CGIPATH"; then
    AC_MSG_ERROR("zentyal css path not found")
  fi
  AC_SUBST(CSSPATH)
  AC_MSG_RESULT($CSSPATH)

  if test -z "$CGIPATH"; then
    AC_MSG_ERROR("zentyal images path not found")
  fi
  AC_SUBST(IMAGESPATH)
  AC_MSG_RESULT($IMAGESPATH)

])
