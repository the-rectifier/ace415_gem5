#!/bin/zsh

set -e

docker build -t gem5/runner .
docker run -u 1000:1000 -v $(pwd):/gem5 -it gem5/runner

