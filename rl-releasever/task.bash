set -e

curl -Ls https://git.resf.org/sig_core/toolkit/raw/branch/devel/mangle/rlutil.py | \
sudo python3 - release --use-baseurl --contentdir stg --releasever $(config version)
