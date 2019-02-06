echo 'original data:' 
echo --------------

(echo "Letter,Color"; echo "A,blAck"; echo "B,Blue") | tee $cache_dir/out.txt

echo
echo 'converted into json data:'
echo --------------

cat $cache_dir/out.txt | catmandu convert CSV to JSON | tee $cache_dir/out2.txt 

echo
echo 'parsed JSON data:'
echo --------------

cat $cache_dir/out2.txt | perl -MJSON -e '$s=decode_json(<STDIN>); print $s->[0]{Letter}," : ",$s->[0]{Color}, "\n", $s->[1]{Letter}," : ",$s->[1]{Color}'

