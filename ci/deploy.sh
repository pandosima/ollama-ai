#!/bin/bash

# set e

SERVER_SSH=$1
DEPLOY_PATH=$2
SSH_KEY=$3


ROOT_DIR=$(git rev-parse --show-toplevel)
cd ${ROOT_DIR}

#syn source to deploy server
echo syn source to server
rsync -i ${SSH_KEY} -avzh --omit-dir-times --exclude '.git' ./  ${SERVER_SSH}:${DEPLOY_PATH}
cd ${SOURCE_DIR}

#build and run docker container
echo building source...
ssh -i ${SSH_KEY} ${SERVER_SSH} env DEPLOY_PATH="$DEPLOY_PATH"  /bin/bash <<'EOT'
cd ${DEPLOY_PATH}

if [ ! -d ./ollama_data]; then
    mkdir -p ./ollama_data
fi

echo build docker container
docker compose --env-file docker.env build
echo run docker container
docker compose --env-file docker.env up -d
echo deploying finished. || exit 1\
EOT