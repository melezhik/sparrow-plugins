set -e

set -x

curl -kfs https://raw.githubusercontent.com/hankache/raku.nanorc/master/raku.nanorc -o $homebrew_base/share/nano/raku.nanorc

echo "we are almost set, please add <include /Users/alex/homebrew/share/nano/raku.nanorc> to your ~/.nanorc file"
