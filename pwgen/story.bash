#!bash
set -e;
export len=$(config len);
echo -n "password: ["
perl -MCrypt::RandPasswd -e 'print ((Crypt::RandPasswd->word($ENV{len},$ENV{len}))[0])';
echo -n "]"
echo;
echo;
