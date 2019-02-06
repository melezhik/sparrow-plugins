debug=$(config debug)

[[ $debug ]] && set -x

build_cmd
$cmd "$hosts" "ls -alht $destination"

[[ $ignore_errors == 'true' ]] && exit 0
