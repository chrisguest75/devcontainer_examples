# README

Demonstrate using `docker compose` inside a devcontainer.  

Demonstrates:

* Using features like docker compose.
* It seems to be much quicker to build.  

- [README](#readme)
  - [Start (vscode)](#start-vscode)
  - [Building and Running](#building-and-running)
  - [Stop](#stop)
  - [Resources](#resources)

Used reverse proxy example Ref:[docker_examples/44_reverse_proxy](https://github.com/chrisguest75/docker_examples/tree/master/44_reverse_proxy)  

## Start (vscode)

```sh
# start bash devcontainer
./devcontainerctl.sh -n=09_docker_compose

# start bash devcontainer (rebuild)
./devcontainerctl.sh -n=09_docker_compose --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Building and Running

```sh
cd 44_reverse_proxy

docker compose up -d
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=09_docker_compose --down
```

## Resources

* devcontainers/cli repo [here](https://github.com/devcontainers/cli)  
* devcontainers-contrib/features repo [here](https://github.com/devcontainers-contrib/features)
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
