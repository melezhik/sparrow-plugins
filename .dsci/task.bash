set -e

export SP6_REPO=file://$HOME/repo

new_commit=$(config DSCI_COMMIT)

old_commit=$(config DSCI_COMMIT)

if test -f ~/sparrow-plugins.commit; then
  old_commit=$(cat ~/sparrow-plugins.commit)
fi

ch ../git-updated-dirs

s6 --upload
s6 --index-update

cd ../

eval $(s6 --plg-run --inline git-updated-dirs@dir=.,commit_new=$new_commit,commit_old=$old_commit,level=0)

for d in "${dirs[@]}"; do
  echo "Processing: $d"
  cdir=$PWD
  ch $d
  s6 --upload
  s6 --index-update
  ch $cdir
done

echo -n $new_commit > ~/sparrow-plugins.commit
