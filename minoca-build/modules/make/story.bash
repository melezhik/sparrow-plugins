export SRCROOT=$(config srcroot)
export ARCH=$(config arch)
export DEBUG=$(config debug)
tools_bin=$(config tools)
export PATH=$tools_bin:$SRCROOT/$ARCH$DEBUG/tools/bin:$PATH

verbose=$(config verbose)

target=$(story_var target)

target_safe_name=$(story_var target_safe_name)

echo -n make $target ... ' '

cd $SRCROOT/third-party || exit 1

if test "${verbose}" = "on"; then

  make $target || exit 1

else

  if make $target 1>$test_root_dir/make-$target_safe_name.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/make-$target_safe_name.report.txt
    ls -l $test_root_dir/make-$target_safe_name.report.txt
    tail -n 10 $test_root_dir/make-$target_safe_name.report.txt
    exit 1
  fi
  
fi


if test -f $SRCROOT/$ARCH$DEBUG/tools/bin/perl; then

  echo "disabling" perl from $SRCROOT/$ARCH$DEBUG/tools/bin/ path:
  mv -v $SRCROOT/$ARCH$DEBUG/tools/bin/perl $SRCROOT/$ARCH$DEBUG/tools/bin/perl.off || exit 1

fi

