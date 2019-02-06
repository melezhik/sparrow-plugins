debug=$(config debug)

[[ $debug ]] && set -x

command=$( config command )

build_cmd
$cmd "$hosts" "$command"

[[ $ignore_errors == 'true' ]] && exit 0
