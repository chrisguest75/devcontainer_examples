# README

Demonstrate a simple cpp container with `cmake`.  

## Example

Based on my examples from shell_examples:

* [cpp_examples/README.md](https://github.com/chrisguest75/cpp_examples/tree/master/README.md)  

## Start (vscode)

```sh
devcontainer up --remove-existing-container --build-no-cache --config $(pwd)/.devcontainer/06_cpp/devcontainer.json
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Run tests

```sh
cd ./01_helloworld_cmake
echo $DEVCONTAINER_TYPE

mkdir -p build
cd build
cmake ..

cmake --build .  
./helloworld
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=06_cpp --down
```

## Resources

