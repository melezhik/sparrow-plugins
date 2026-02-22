set -e

new_commit=$(config DSCI_COMMIT)

old_commit=$(config DSCI_COMMIT)

if test -f ~/sparrow-plugins.commit; then
  old_commit=$(cat ~/sparrow-plugins.commit)
fi

chdir ../

eval $(s6 --plg-run --inline git-updated-dirs@dir=.,commit_new=$new_commit,commit_old=$old_commit,level=0)

export SP6_REPO=file://$HOME/repo

for d in "${dirs[@]}"; do
  echo "Processing: $d"
  cdir=$PWD
  chdir $d
  s6 --upload
  s6 --index-update
  chdir $cdir
done

echo -n $new_commit > ~/sparrow-plugins.commit
