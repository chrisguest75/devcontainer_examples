# README

Demonstrate `docker in docker` builds in a devcontainer.  

Demonstrates:

* Docker in Docker isolation

## Contents

- [README](#readme)
  - [Contents](#contents)
  - [Start (vscode)](#start-vscode)
  - [Docker Example](#docker-example)
  - [Compose Example](#compose-example)
  - [Stop](#stop)
  - [Resources](#resources)

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

```sh
# start devcontainer
./devcontainerctl.sh -n=04_docker_in_docker

# start devcontainer (rebuild)
./devcontainerctl.sh -n=04_docker_in_docker --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Docker Example

```sh
echo $DEVCONTAINER_TYPE

docker images

docker ps -a
```

Goto [./60_heredocs/README.md](./60_heredocs/README.md)  

## Compose Example

```sh
cd 44_reverse_proxy

docker compose up -d
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=04_docker_in_docker --down
```

## Resources

* devcontainers/cli repo [here](https://github.com/devcontainers/cli)  
* devcontainers-contrib/features repo [here](https://github.com/devcontainers-contrib/features)
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
