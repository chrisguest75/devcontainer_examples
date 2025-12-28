#!/bin/bash/env bash
echo "Executing postCreateCommand.sh"

echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

# shellcheck source=/dev/null
. "25_caching_features/.config/.devcontainer.env"

