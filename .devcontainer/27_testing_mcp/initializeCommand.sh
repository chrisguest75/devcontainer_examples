#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
export DEVCONTAINER_TYPE=27_testing_mcp
mkdir -p "${DEVCONTAINER_TYPE}/config"
echo "export GITHUB_TOKEN=$(gh auth token)" > "${DEVCONTAINER_TYPE}/config/.devcontainer.env"
echo "export TENV_GITHUB_TOKEN=$(gh auth token)" >> "${DEVCONTAINER_TYPE}/config/.devcontainer.env"
