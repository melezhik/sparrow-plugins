verbose=$(config verbose)

SRCROOT=$(config srcroot)
ARCH=$(config arch)
DEBUG=$(config debug)
tools_bin=$(config tools)
PATH=$tools_bin:$SRCROOT/$ARCH$DEBUG/tools/bin:$PATH

if test "${verbose}" = "on"; then

  echo SRCROOT: $SRCROOT
  echo DEBUG  : $DEBUG
  echo ARCH   : $ARCH
  echo PATH   : $PATH

fi

