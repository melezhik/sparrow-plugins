url=$(story_var url)
file=$(story_var file)
set -e

mkdir -p ~/.rakudo-cache

 
if test -f ~/.rakudo-cache/$file; then
  echo ~/.rakudo-cache/$file exists, skip download
else
  echo download $url to ~/.rakudo-cache/$file
  curl -L -f -s $url -o ~/.rakudo-cache/$file
fi

ls -lh ~/.rakudo-cache/$file 

