#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
mkdir -p 25_caching_features/.config
echo "export GITHUB_TOKEN=$(gh auth token)" > 25_caching_features/.config/.devcontainer.env
echo "export TENV_GITHUB_TOKEN=$(gh auth token)" >> 25_caching_features/.config/.devcontainer.env
