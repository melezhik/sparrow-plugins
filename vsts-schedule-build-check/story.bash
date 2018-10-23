set -x
pattern=$(config pattern)
dir=$(config dir)
cd $dir
set -x
vsts build list | grep "${pattern}"|grep schedule
