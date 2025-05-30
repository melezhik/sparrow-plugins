set -e

curl -kfs https://raw.githubusercontent.com/hankache/raku.nanorc/master/raku.nanorc -o $homebrew_base/share/nano/raku.nanorc

echo "we are almost set"
echo "please add"
echo "echo 'include $homebrew_base/share/nano/raku.nanorc' >> ~/.nanorc file"
