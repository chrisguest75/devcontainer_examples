# README

Demonstrate a `typescript` build environment in a devcontainer

Demonstrates:

* Node16

TODO:

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

```sh
# start devcontainer
./devcontainerctl.sh -n=03_typescript_container

# start devcontainer (rebuild)
./devcontainerctl.sh -n=03_typescript_container --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Example

```sh
echo $DEVCONTAINER_TYPE
```

Goto [03_typescript_container/99_test/TEMPLATE_README.md](03_typescript_container/99_test/TEMPLATE_README.md) and follow the instructions to build and run the code.  

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=03_typescript_container --down
```

## Resources

