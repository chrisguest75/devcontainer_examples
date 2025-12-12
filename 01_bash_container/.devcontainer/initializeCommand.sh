#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
mkdir -p 01_bash_container/config
echo "export GITHUB_TOKEN=$(gh auth token)" > 01_bash_container/config/.devcontainer.env
