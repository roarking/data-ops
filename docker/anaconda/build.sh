#!/bin/bash

set -o pipefail

IMAGE=ps-data/anaconda
VERSION=1.0.0

docker build -t ${IMAGE}:${VERSION} . | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')
docker tag $ID ${IMAGE}:latest
rm build.log