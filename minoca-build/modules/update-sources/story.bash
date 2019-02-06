export SRCROOT=$(config srcroot)
export ARCH=$(config arch)
export DEBUG=$(config debug)
tools_bin=$(config tools)
export PATH=$tools_bin:$SRCROOT/$ARCH$DEBUG/tools/bin:$PATH

verbose=$(config verbose)

echo -n updates os sources ... ' '

cd $SRCROOT/os || exit 1

if test "${verbose}" = "on"; then

  git pull || exit 1

else

  if git pull 1>$test_root_dir/update-source-os.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/update-source-os.report.txt
    ls -l $test_root_dir/update-source-os.report.txt
    tail -n 10 $test_root_dir/update-source-os.report.txt
    exit 1
  fi

fi


echo -n update third party sources ... ' '

cd $SRCROOT/third-party || exit 1

if test "${verbose}" = "on"; then

  git pull || exit 1

else

  if git pull 1>$test_root_dir/update-source-third-party.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/update-source-third-party.report.txt
    ls -l $test_root_dir/update-source-third-party.report.txt
    tail -n 10 $test_root_dir/update-source-third-party.report.txt
    exit 1
  fi

fi


