owner=$(config owner)
group=$(config group)
mode=$(config mode)
target=$(config target)
on_change=$(config on_change)

touch $target || exit 1

if test -f $target && ! diff -q $test_root_dir/content.tmp $target ; then

    echo updating target $target ...

    echo "outthentic_message: updated ok";

    diff -u $test_root_dir/content.tmp $target

    if test "${on_change}"; then
      echo running on change hook: $on_change
      eval $on_change
    fi
else
  echo "outthentic_message: not changed";
fi

cp $test_root_dir/content.tmp $target || exit 1
echo target $target updated

if test "${owner}"; then 
  chown $owner $target || exit 1;
  echo set target owner to $owner
fi

if test "${group}"; then 
  chown :$group $target || exit 1;
  echo set target group to $group
fi

if test "${mode}"; then 
  chmod $mode $target || exit 1;
  echo set target mode to $mode
fi
