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
    -n --name=[devcontainer]        Name of container to bring up
    --down                          Stop the devcontainer

    --no-cache                      Rebuild with no caching

    -h --help -?                    show this help

Examples:
    $SCRIPT_NAME --help 

EOF
}

_CONTAINERNAME=""
_NOCACHE=""
_DOWN=""

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
        _NOCACHE="--build-no-cache"
        shift # past argument=value
    ;;     
    --down)
        _DOWN=true
        shift # past argument=value
    ;;
    *)
        >&2 echo "Unrecognised option '$i', specify --help"
        exit 0
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

if [[ -z "${_DOWN}" ]]; then 
    #devcontainer up --remove-existing-container ${_NOCACHE} --config "$(pwd)/.devcontainer/${_CONTAINERNAME}/devcontainer.json"
    devcontainer up --id-label containername=${_CONTAINERNAME} --remove-existing-container ${_NOCACHE} --config "$(pwd)/.devcontainer/${_CONTAINERNAME}/devcontainer.json"
else
    CONTAINERID=$(docker ps -aqf label=containername=${_CONTAINERNAME})
    if [[ -z "${CONTAINERID}" ]]; then
        echo "${_CONTAINERNAME} not found"
    else
        echo "Stopping ${_CONTAINERNAME} as ${CONTAINERID}"
        docker stop ${CONTAINERID} && docker rm $_
    fi
fi
