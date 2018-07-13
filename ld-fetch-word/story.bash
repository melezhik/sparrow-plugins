#!bash

word=$(config word)
out=$(config out)
sleep=$(config sleep)

echo sleep for $sleep sec ...
sleep $sleep

echo ============================================================

echo >> $out
echo >> $out

echo "{{{ $word }}}" >> $out 

curl https://www.ldoceonline.com/dictionary/$word -s -L | perl -n -e '
print $_, "\n" for /title="Play Example"> <\/span>(.*?)<\/span>/mg' | \
perl -n -e  's/<span.*>//; print' | tee -a  $out

echo ============================================================
echo $out updated
