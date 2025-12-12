#!/bin/bash/env bash
echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

cat /proc/version
lscpu

# install pre-commit
uv tool install pre-commit

# shellcheck source=/dev/null
. "21_renovate/config/.devcontainer.env"

# shellcheck source=/dev/null
. "${NVM_DIR}/nvm.sh" && nvm install --lts

npm install -g renovate

renovate --version
