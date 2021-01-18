#!/bin/bash

if [[ ${MACHTYPE} =~ "aarch64" ]]; then
  echo "aarch64"
  LatestRelease=$(curl -s https://github.com/mxpv/podsync/releases/ | grep -e 'href.*arm64' -m 1 | cut -f2 -d \")
elif [[ ${MACHTYPE} =~ "x86_64" ]]; then
  echo "x86_64"
  LatestRelease=$(curl -s https://github.com/mxpv/podsync/releases/ | grep -e 'href.*armv6' -m 1 | cut -f2 -d \")
fi
Link=https://github.com/$LatestRelease

wget $Link

tar -xvzf *.gz
rm LICENSE
rm README.md
rm *tar.gz
docker build -t local/podsync .
