#!/bin/bash

# Fast fail
set -o errexit
set -o nounset
set -o pipefail

FILE=${1:-/app/app.py}

docker build -t localcs450:latest .
cd src && docker run --rm -it localcs450:latest -m pycodestyle --ignore=E501 ./*.py
docker run --rm -it localcs450:latest -m pylint --disable=line-too-long --recursive=y .
docker run --rm -it localcs450:latest $FILE
