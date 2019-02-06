debug=$(config debug)

[[ $debug ]] && set -x

files=$( find_targets )

for file in $files; do

  echo "Processing file: $file"
  if [[ "$dry_run" ]]; then
     echo "Your $file will be deleted"
  else

  rm -rf $file || exit 15
  echo "File: $file deleted"

  fi
 
done

