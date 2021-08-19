#!bash

set +e

echo "run tasks/set-user-paths"

targets=("python3" "python3")  # bins

# Get existing interpreters.
interps=()
for target in $targets; do
    [ `command -v $target` ] && interps+=($target)
done

# Check for a non-standard install directory.
user_base="${HOME}/.local"
[ $PYTHONUSERBASE ] && user_base=$PYTHONUSERBASE

# Add version specific paths, if:
#   it exists in the filesystem;
#   it isn't in PYTHONPATH already.
for interp in $interps; do
    # Get minor release version.
    ver=`$interp -V 2>&1`
    ver=`echo ${ver:7} | cut -d '.' -f 1,2`  # The patch version is variable length, truncate it.
    site_pkgs="${user_base}/lib/python${ver}/site-packages"
    [[ -d $site_pkgs && ! $PYTHONPATH =~ $site_pkgs ]] && echo PYTHONPATH=${site_pkgs}:\$PYTHONPATH
done

