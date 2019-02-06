
debug=$(config debug)
[[ $debug ]] && set -x

if [[ $os == archlinux ]]; then
  echo "cleaning pacman cache..."
  pacman -Scc --noconfirm || exit 11
  echo "cleaned"
else
  echo "Your os ($os) is not supported yet."
fi
