#!/usr/bin/env bash
echo "executing initializeCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

pwd
echo "export GITHUB_TOKEN=$(gh auth token)" > .envrc
