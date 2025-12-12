#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
mkdir -p 20_tenv/config
echo "export GITHUB_TOKEN=$(gh auth token)" > 20_tenv/config/.devcontainer.env
echo "export TENV_GITHUB_TOKEN=$(gh auth token)" >> 20_tenv/config/.devcontainer.env
