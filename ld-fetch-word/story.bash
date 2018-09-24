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

curl -k https://www.ldoceonline.com/dictionary/$word -s -L -o - | \
#cat /tmp/out.txt | \
perl -MHTML::Strip -n  -e '
my $l = $_;

if ($l=~/title="Play Example"/ .. /title="Play Example">/ ) {
  print HTML::Strip->new()->parse($_), "\n" for $l=~/<\/span>(.*?)<\/span>/; 
}; 
'

echo $out updated
