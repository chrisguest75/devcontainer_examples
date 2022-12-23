# README

Demonstrate a simple zsh container using features.  

Demonstrates:

* Using features
* It seems to be much quicker to build.  

- [README](#readme)
  - [Start (vscode)](#start-vscode)
  - [Resources](#resources)

## Start (vscode)

```sh
# start bash devcontainer
./startdevcontainer.sh -n=07_oh_my_zsh

# start bash devcontainer (rebuild)
./startdevcontainer.sh -n=07_oh_my_zsh --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```


## Stop

```sh
# stop devcontainer
./startdevcontainer.sh -n=07_oh_my_zsh --down
```

## Resources

* devcontainers/cli repo [here](https://github.com/devcontainers/cli)  
* devcontainers-contrib/features repo [here](https://github.com/devcontainers-contrib/features)
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
