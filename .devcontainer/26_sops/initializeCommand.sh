#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
mkdir -p 26_sops/config
echo "export GITHUB_TOKEN=$(gh auth token)" > 26_sops/config/.devcontainer.env
echo "export TENV_GITHUB_TOKEN=$(gh auth token)" >> 26_sops/config/.devcontainer.env
