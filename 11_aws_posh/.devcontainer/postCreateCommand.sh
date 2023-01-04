#!/bin/bash/env bash
echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

which pwsh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
ls -l $(brew --prefix oh-my-posh)/themes

#./postCreateCommand.ps1
