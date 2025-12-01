m=$(config module)

path=$(config path)

for i in $(grep -lRH "add module $m" $path); do cat $i; done

echo

