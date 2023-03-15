#!/bin/bash

# Fast fail
set -o errexit
set -o nounset
set -o pipefail

ARGS=${@:-/app/app.py}

docker build -t localcs450:latest .
cd src && docker run --rm -it localcs450:latest -m pycodestyle ./*.py
docker run --rm -it localcs450:latest -m pylint --disable=duplicate-code --recursive=y .
docker network create cs450-net || /bin/true # Ignore a failure since the network might already be created, this is to allow networking between containers
docker run --rm -it --net cs450-net localcs450:latest $ARGS
