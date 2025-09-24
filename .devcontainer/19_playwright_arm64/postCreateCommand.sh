#!/bin/bash/env bash
#set -eufo pipefail

echo "executing postCreateCommand.sh"

sudo apt update

cat /proc/version
lscpu

echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" /root/.zshrc
sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" ~/.zshrc

echo "# ********************************************"
echo "# node"
echo "# ********************************************"
. ${NVM_DIR}/nvm.sh && nvm install v20.19.0

echo "# ********************************************"
echo "# playwright"
echo "# ********************************************"
npx playwright install          
npx playwright install-deps   

echo "# ********************************************"
echo "# versions"
echo "# ********************************************"
just --version
node --version
npm --version
npx --version


