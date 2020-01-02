#!/bin/bash

LatestRelease=$(curl -s https://github.com/mxpv/podsync/releases/ | grep -e 'href.*armv6' -m 1 | cut -f2 -d \")
Link=https://github.com/$LatestRelease

wget $Link

tar -xvzf *.gz
rm LICENSE
rm README.md
rm *tar.gz
docker build -t local/podsync .
