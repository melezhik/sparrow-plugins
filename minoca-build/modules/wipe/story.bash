export SRCROOT=$(config srcroot)
export ARCH=$(config arch)
export DEBUG=$(config debug)
tools_bin=$(config tools)
export PATH=$tools_bin:$SRCROOT/$ARCH$DEBUG/tools/bin:$PATH

verbose=$(config verbose)

echo -n wipe os ... ' '

cd $SRCROOT/os || exit 1

if test "${verbose}" = "on"; then

  make wipe || exit 1

else

  if make wipe 1>$test_root_dir/wipe-os.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/wipe-os.report.txt
    ls -l $test_root_dir/wipe-os.report.txt
    tail -n 10 $test_root_dir/wipe-os.report.txt
    exit 1
  fi

fi


echo -n clean third party packages ... ' '

cd $SRCROOT/third-party || exit 1

if test "${verbose}" = "on"; then

  make clean || exit 1

else

  if make clean 1>$test_root_dir/clean-third-party.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/clean-third-party.report.txt
    ls -l $test_root_dir/clean-third-party.report.txt
    tail -n 10 $test_root_dir/clean-third-party.report.txt
    exit 1
  fi

fi


