#!/usr/bin/env bash
set -euf -o pipefail

readonly SCRIPT_NAME=$(basename "$0")
readonly SCRIPT_PATH=${0}
# shellcheck disable=SC2034
readonly SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

function help() {
    cat <<- EOF
usage: $SCRIPT_NAME options

OPTIONS:
    -n --name=[devcontainer]

    -h --help -?               show this help

Examples:
    $SCRIPT_NAME --help 

EOF
}

_CONTAINERNAME=""
_NOCACHE=""

for i in "$@"
do
case $i in
    -h|--help)
        help
        exit 0
    ;;
    -n=*|--name=*)
        _CONTAINERNAME="${i#*=}"
        shift # past argument=value
    ;;  
    --no-cache)
        _NOCACHE="--no-cache"
        shift # past argument=value
    ;;     
esac
done    

# do work here
if [[ -z "${_CONTAINERNAME}" ]]; then 
    >&2 echo "Container name not specified, specify --help"
    exit 2
fi
if [[ ! -d ".devcontainer/${_CONTAINERNAME}" ]]; then 
    >&2 echo "Container name does not exist in ./devcontainer, specify --help"
    exit 2
fi

devcontainer up --remove-existing-container ${_NOCACHE} --config "$(pwd)/.devcontainer/${_CONTAINERNAME}/devcontainer.json"