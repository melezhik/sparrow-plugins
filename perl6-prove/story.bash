#set -x
set -e
path=$(config path)
echo path is: $path
cd $path
prove -verbose -r -e 'perl6 -Ilib' t/ 
