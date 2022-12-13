# README

Demonstrate a simple `powershell` devcontainer

Demonstrates:

* installing powershell

TODO:

* add oh-my-posh

## Start (vscode)

```sh
devcontainer up --remove-existing-container --build-no-cache --config $(pwd)/.devcontainer/02_powershell_container/devcontainer.json
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

## Resources
