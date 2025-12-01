m=$(config module)

path=$(config path)

mkdir -p  ~/.brownie/logs/

rm -rf /tmp/log

for i in $(grep -lRH "add module $m ..." $path); do cat $i >> /tmp/log; done

cp /tmp/log ~/.brownie/logs/$m.log

echo

