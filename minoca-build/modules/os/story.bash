export SRCROOT=$(config srcroot)
export ARCH=$(config arch)
export DEBUG=$(config debug)
tools_bin=$(config tools)
export PATH=$tools_bin:$SRCROOT/$ARCH$DEBUG/tools/bin:$PATH

verbose=$(config verbose)

echo -n make os ... ' '

cd $SRCROOT/os || exit 1

if test "${verbose}" = "on"; then

  make $target || exit 1

else

  if make $target 1>$test_root_dir/make-os.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/make-os.report.txt
    ls -l $test_root_dir/make-os.report.txt
    tail -n 10 $test_root_dir/make-os.report.txt
    exit 1
  fi

fi


