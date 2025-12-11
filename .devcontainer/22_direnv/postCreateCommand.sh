#!/bin/bash/env bash
echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

cat /proc/version
lscpu

sudo apt update && sudo apt install -y direnv
echo "direnv version: $(direnv --version)"

direnv hook zsh >> ~/.zshrc  
direnv allow /workspaces/devcontainer_examples/22_direnv/env1/.envrc
direnv allow /workspaces/devcontainer_examples/22_direnv/env2/.envrc
