#!/bin/bash/env bash
echo "Executing postCreateCommand.sh"

sudo apt update
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

# shellcheck source=/dev/null
. "${DEVCONTAINER_TYPE}/config/.devcontainer.env"

env | sort

sudo sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" /root/.zshrc
sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" ~/.zshrc

# install pre-commit
uv tool install pre-commit


