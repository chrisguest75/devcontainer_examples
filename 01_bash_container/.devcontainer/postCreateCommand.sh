#!/bin/bash/env bash

echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

#brew install bats-core
#sudo apt update && sudo apt install -y bats
echo "bats version: $(bats --version)"

cat 01_bash_container/config/.devcontainer.env
