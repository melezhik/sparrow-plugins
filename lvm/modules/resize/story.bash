debug=$(config debug)

[[ $debug ]] && set -x 

required="lv vg"
for param in $required ; do
  if [[ -z $(config $param) ]]; then
    echo "Parameter $param required. Exiting..."
    exit 2
  fi
done

volume_group=$(config vg)
logical_volume=$(config lv)
amount=$(config size)
add_amount=$(config add)
reduce_amount=$(config reduce)
resize_fs=$(config resize-fs)


if [[ $resize_fs == 'true' ]]; then
  resize_opts+=' -r'
fi

if [[ $add_amount ]] ; then
  amount="+$add_amount"
elif [[ $reduce_amount ]] ;then
  amount="-$reduce_amount"
fi

if [[ $amount ]] || [[ $add_amount ]] || [[ $reduce_amount ]]; then

  lvresize $resize_opts -L $amount /dev/mapper/$volume_group-$logical_volume

fi
