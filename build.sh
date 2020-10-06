#!/bin/bash

#
# VCV Plugin Builder Linux
#
# Author: cschol, Mar 2018
#

set -e

docker version &> /dev/null
if [ $? -eq 1 ]; then
    echo "ERROR: Docker is required to run this script!"
    echo "Visit https://docs.docker.com/install/ for more information."
    exit 1
fi

# Location of Rack source code.
if [ -z ${RACK_DIR} ]; then
    echo "ERROR: Environment variable RACK_DIR not defined"
    exit 1
fi
# Location of Plugin source code.
if [ -z ${WORKING_DIR} ]; then
    echo "ERROR: Environment variable WORKING_DIR not defined"
    exit 1
fi

DOCKER_IMAGE_NAME=vcv-plugin-builder-linux

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t ${DOCKER_IMAGE_NAME} ${SCRIPT_DIR}
docker run \
    --rm \
    -e RACK_DIR=/opt/Rack \
    -v ${RACK_DIR}:/opt/Rack:ro \
    -v ${WORKING_DIR}:/opt/workspace \
    -w /opt/workspace \
    --user $(id -u):$(id -g) \
    --entrypoint "make" \
    --entrypoint "/bin/bash" \
	${DOCKER_IMAGE_NAME} \
	-c "make clean && make dist -j$(nproc --all)"

exit 0
