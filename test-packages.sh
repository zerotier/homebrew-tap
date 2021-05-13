#!/bin/bash

packages=(
  libzt
  zeronsd
)

cmdline="brew tap zerotier/test-tap file:///taps && (for pkg in ${packages[@]}; do brew install zerotier/test-tap/\$pkg; done)"

if [ "$(git status -s | grep -v \? | wc -l)" != 0 ]
then
  echo "You have a dirty tree; please commit it before continuing"
  exit 1
fi

case "$(uname -s)" in
  Linux)
    docker run -it -v ${PWD}:/taps linuxbrew/brew bash -c "$cmdline"
    ;;
  Darwin)
    bash -c "$cmdline"
    ;;
esac
