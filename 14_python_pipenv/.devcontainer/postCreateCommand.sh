#!/bin/bash/env bash
echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

brew install cookiecutter
brew install pre-commit
brew install commitizen