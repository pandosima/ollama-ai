#!/bin/bash

set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
cd ${ROOT_DIR}

#docker files
echo preprocess docker compose files
cp -f ${ROOT_DIR}/ci/docker.env.template ${ROOT_DIR}/docker.env
find ${ROOT_DIR}/docker.env -type f -name "*" | xargs sed -i'' s/OLLAMA_PORT=/OLLAMA_PORT=${OLLAMA_PORT}/g
find ${ROOT_DIR}/docker.env -type f -name "*" | xargs sed -i'' s/NETWORK_NAME=/NETWORK_NAME=${NETWORK_NAME}/g

echo "Done."
