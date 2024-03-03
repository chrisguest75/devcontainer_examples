# README

Demonstrate a simple `powershell` devcontainer

Demonstrates:

* Installing powershell

TODO:

* add oh-my-posh

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

```sh
# start devcontainer
./devcontainerctl.sh -n=02_powershell_container

# start devcontainer (rebuild)
./devcontainerctl.sh -n=02_powershell_container --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Run tests

```sh
echo $DEVCONTAINER_TYPE
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=02_powershell_container --down
```

## Resources
