#!/bin/bash/env bash
echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

cat /proc/version
lscpu

. ${NVM_DIR}/nvm.sh && nvm install --lts

npm install -g renovate

renovate --version
