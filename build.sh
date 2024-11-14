#!/bin/bash
source config.sh

PROGRESS=--progress=plain

docker build ${PROGRESS} \
       "--build-arg=PIP_TORCH=${PIP_TORCH}" \
       "--build-arg=PIP_HF=${PIP_HF}" \
       "--build-arg=PIP_OTHER=${PIP_OTHER}" \
       "--build-arg=PIP_PROJECT=${PIP_PROJECT}" \
       "--build-arg=DOCKER_USER=${DOCKER_USER}" \
       -t $IMAGE_NAME .
