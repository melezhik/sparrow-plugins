url=$(task_var url)

echo "something went wrong ... if $url alive?"
echo "to check it try: curl -f -D - $url"

exit 1

