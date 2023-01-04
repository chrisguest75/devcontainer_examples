# README

Demonstrate a simple terraform container.  

Demonstrates:

* Using features
* It seems to be much quicker to build.  

TODO:

* THIS IS NOT WORKING

- [README](#readme)
  - [Start (vscode)](#start-vscode)
  - [Stop](#stop)
  - [Resources](#resources)

## Start (vscode)

```sh
# start bash devcontainer
./devcontainerctl.sh -n=10_terraform

# start bash devcontainer (rebuild)
./devcontainerctl.sh -n=10_terraform --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=10_terraform --down
```

## Resources

* devcontainers/cli repo [here](https://github.com/devcontainers/cli)  
* devcontainers-contrib/features repo [here](https://github.com/devcontainers-contrib/features)
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
