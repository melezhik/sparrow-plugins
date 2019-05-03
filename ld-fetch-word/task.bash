#!bash

set -e

word=$(config word)
out=$(config out)
sleep=$(config sleep)
cache=$(config cache)

if test "${cache}" && test -f "${cache}/${word}"; then
  echo "cache exists ${cache}/${word} - exiting ..."
  exit 0
fi

echo sleep for $sleep sec ...
sleep $sleep

echo ============================================================

echo >> $out
echo >> $out

echo "{{{ $word }}}" | tee -a $out 

curl https://www.ldoceonline.com/dictionary/$word -k -s -L | perl -MHTML::Strip -n -e '
print $_, "\n" for /title="Play Example"> <\/span>(.*?)<\/span>/mg; 
#print "[$1]\n" if /<meta name="description" content="(.*?)"/;
print "/", $1, "/\n" if /<span class="PRON">(.*?)<\/span>/;
print "============================================================\n",
++$i, ". ", HTML::Strip->new()->parse($1), 
"\n" if /<span class="DEF">(.*?)<\/span>/
'| \
perl -n -e  's/<span.*>//; print' | tee -a  $out


if test "${cache}" && ! test "${out}" = "/dev/null"; then
  echo ============================================================
  echo "update cache - ${cache}/${word} ..."
  touch "${cache}/${word}"
fi


echo ============================================================
echo $out updated
