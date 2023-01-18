#!/bin/bash

# Fast fail
set -o errexit
set -o nounset
set -o pipefail

docker build -t localcs450:latest .
cd src && docker run --rm -it localcs450:latest -m pycodestyle ./*.py
docker run --rm -it localcs450:latest -m pylint --recursive=y .
docker run --rm -it localcs450:latest