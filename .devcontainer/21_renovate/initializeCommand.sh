#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
mkdir -p 21_renovate/config
echo "export GITHUB_TOKEN=$(gh auth token)" > 21_renovate/config/.devcontainer.env
echo "export TENV_GITHUB_TOKEN=$(gh auth token)" >> 21_renovate/config/.devcontainer.env
echo "export RENOVATE_TOKEN=$(gh auth token)" >> 21_renovate/config/.devcontainer.env
