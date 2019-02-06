export SRCROOT=$(config srcroot)
export ARCH=$(config arch)
export DEBUG=$(config debug)
tools_bin=$(config tools)
export PATH=$tools_bin:$SRCROOT/$ARCH$DEBUG/tools/bin:$PATH
verbose=$(config verbose)


cd $SRCROOT/third-party/build/opkg-utils || exit 1 
mkdir -p $SRCROOT/$ARCH$DEBUG/bin/apps
mkdir -p $SRCROOT/$ARCH$DEBUG/bin/packages

echo exporting packages to $SRCROOT/$ARCH$DEBUG/bin/apps ...

for p in $(ls -1 $SRCROOT/$ARCH$DEBUG/bin/packages); do
  echo  "copy $p ..." 
  bash opkg-extract-data $SRCROOT/$ARCH$DEBUG/bin/packages/$p $SRCROOT/$ARCH$DEBUG/bin/apps
done

echo -n make clean image ... ' '

cd $SRCROOT/os/images || exit 1

if test "${verbose}" = "on"; then

  make clean || exit 1

else

  if make clean 1>$test_root_dir/make-clean-image.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/make-clean-image.report.txt
    tail -n 10 $test_root_dir/make-clean-image.report.txt
    exit 1
  fi
fi  

echo -n make image ... ' '

cd $SRCROOT/os/images || exit 1

if test "${verbose}" = "on"; then

    make || exit 1

else

  if make 1>$test_root_dir/make-image.report.txt 2>&1; then
    echo ok
  else
    echo failed
    echo last 10 lines at report file: $test_root_dir/make-image.report.txt
    tail -n 10 $test_root_dir/make-image.report.txt
    exit 1
  fi

fi
  
ls -l $SRCROOT/$ARCH$DEBUG/bin/*.img
