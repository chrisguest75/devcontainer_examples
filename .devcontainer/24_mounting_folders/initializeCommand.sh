#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
mkdir -p 24_mounting_folders/config
echo "export GITHUB_TOKEN=$(gh auth token)" > 24_mounting_folders/config/.devcontainer.env
echo "export TENV_GITHUB_TOKEN=$(gh auth token)" >> 24_mounting_folders/config/.devcontainer.env
