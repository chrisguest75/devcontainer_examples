#!/bin/bash/env bash
echo "Executing postCreateCommand.sh"

echo "uname: $(uname -a)"
echo "whoami: $(whoami)"
echo "TERRAFORM_VERSION:${TERRAFORM_VERSION}"

env | sort

sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" /root/.zshrc
sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" ~/.zshrc

brew install tfenv
