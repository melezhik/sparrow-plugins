set -e

if test $(config deployment) = "True"; then

  if test -f deployment.c4; then
    cat deployment.c4
  else
    cat << 'HERE' > deployment.c4
deployment {
}
views {
}
HERE
    cat deployment.c4
  fi
else

  if test -f model.c4; then
    cat model.c4
  else
    cat << 'HERE' > model.c4
model {
}
views {
}
HERE
    cat model.c4
  fi
fi
