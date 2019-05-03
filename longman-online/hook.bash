set -e

word=$(config word)

sleep=$(config sleep)

mkdir -p ~/longman-online/$word/mp3

if ! test -f ~/longman-online/$word/data.txt; then
  curl -s http://www.ldoceonline.com/dictionary/$word -o ~/longman-online/$word/data.txt
fi

run_task parse-page file ~/longman-online/$word/data.txt

