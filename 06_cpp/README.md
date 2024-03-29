# README

Demonstrate a simple cpp container with `cmake`.  

## Example

Based on my examples from shell_examples:

* [cpp_examples/README.md](https://github.com/chrisguest75/cpp_examples/tree/master/README.md)  

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

```sh
# start devcontainer
./devcontainerctl.sh -n=06_cpp

# start devcontainer (rebuild)
./devcontainerctl.sh -n=06_cpp --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Run tests

```sh
cd ./06_cpp
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

