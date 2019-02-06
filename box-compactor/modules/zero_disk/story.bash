debug=$(config debug)
[[ $debug ]] && set -x

EMPTYFILE='empty.zero'
dd if=/dev/zero of=/${EMPTYFILE} bs=1M 2>/dev/null

rm -rf /${EMPTYFILE} && echo cleaned

for swappart in $(grep partition /proc/swaps | awk -F ' ' '{print $1}')
do
  swapoff $swappart
  dd if=/dev/zero of=$swappart 2>/dev/null
  mkswap -f $swappart
  swapon $swappart
done

sync
