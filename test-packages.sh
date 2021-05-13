#!/bin/bash

packages=(
  libzt
  zeronsd
)

cmdline="brew tap zerotier/test-tap file:///taps && (for pkg in ${packages[@]}; do brew install zerotier/test-tap/\$pkg; done)"

case "$(uname -s)" in
  Linux)
    docker run -it -v ${PWD}:/taps linuxbrew/brew bash -c "$cmdline"
    ;;
  Darwin)
    bash -c "$cmdline"
    ;;
esac
