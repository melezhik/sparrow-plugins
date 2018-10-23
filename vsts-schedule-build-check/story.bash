pattern=$(config pattern)
set -x
vsts build list | grep "${pattern}"|grep schedule
