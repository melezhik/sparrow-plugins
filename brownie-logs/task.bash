m=$(config module)

path=$(config path)

mkdir -p  ~/.brownie/logs/

for i in $(grep -lRH "add module $m ..." $path); do cp -v $i ~/.brownie/logs/$i.log; done

echo

