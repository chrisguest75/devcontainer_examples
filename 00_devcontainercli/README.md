# DEVCONTAINER CLI

## Install

```sh
nvm use
npm install -g @devcontainers/cli
```

## Start

```sh
# start devcontainer
./devcontainerctl.sh -n=01_bash_container

# start devcontainer (rebuild)
./devcontainerctl.sh -n=01_bash_container --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Run & Stop

Use CLI  

```sh
# start bash devcontainer
./devcontainerctl.sh -n=01_bash_container --no-cache

# stop bash devcontainer
./devcontainerctl.sh -n=01_bash_container --down
```

