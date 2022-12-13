# README

Demonstrate a simple bash container with `shellcheck` added.  

Demonstrates:

* environment variables
* vscode extensions
* packages installed into the container
* postCreateCommand
* overriding default shell from bash to zsh

NOTES:

* `oh-my-zsh` is installed by default.
* home folder is `/home/vscode`

## Example

Based on my examples from shell_examples:

* [13_bats](https://github.com/chrisguest75/shell_examples/tree/master/13_bats)  
* [13_bats_mock](https://github.com/chrisguest75/shell_examples/tree/master/13_bats_mock)  
* [21_nice_prompt](https://github.com/chrisguest75/docker_examples/tree/master/21_nice_prompt)  

## Start (vscode)

```sh
devcontainer up --remove-existing-container --build-no-cache --config $(pwd)/.devcontainer/01_bash_container/devcontainer.json
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Run tests

```sh
cd ./01_bash_container
echo $DEVCONTAINER_TYPE
./hello-world.sh
```

Follow steps in [13_bats](./13_bats/README.md)  

```sh
cd ./13_bats
./configure.sh
```

Follow steps in [18_bats_mock](./18_bats_mock/README.md)  

```sh
cd ./18_bats_mock
./configure.sh
```

## Resources

* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
