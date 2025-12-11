#!/bin/bash/env bash
echo "executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

cat /proc/version
lscpu

sudo apt update && sudo apt install -y golang-go
echo "go version: $(go version)"
go env
