worker_cmd=$(config worker_cmd)

echo look up "{{{$worker_cmd}}}" at proccess list ...

ps uax | grep "$worker_cmd" | grep -v grep || exit 2


