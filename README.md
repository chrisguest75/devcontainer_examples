# DevContainer Examples

[![Repository](https://skillicons.dev/icons?i=docker,bash,linux)](https://skillicons.dev)

A repository for showing examples of how to use `devcontainers`.  

The Remote - Containers extension lets you use a Docker container as a full-featured development environment. Whether you deploy to containers or not, containers make a great development environment because you can:

* Develop with a consistent, easily reproducible toolchain on the same operating system you deploy to.
* Quickly swap between different, separate development environments and safely make updates without worrying about impacting your local machine.
* Make it easy for new team members / contributors to get up and running in a consistent development environment.
* Try out new technologies or clone a copy of a code base without impacting your local setup.

Based on my examples from docker_examples [41_remote_containers](https://github.com/chrisguest75/docker_examples/tree/master/41_remote_containers) and [41_nodejs_remote_devcontainer](https://github.com/chrisguest75/docker_examples/tree/master/41_nodejs_remote_devcontainer).  

- [DevContainer Examples](#devcontainer-examples)
  - [Getting started](#getting-started)
  - [Github cli codespaces](#github-cli-codespaces)
  - [Run \& Stop](#run--stop)
  - [01 - bash development example](#01---bash-development-example)
  - [02 - powershell development example](#02---powershell-development-example)
  - [03 - typescript development example](#03---typescript-development-example)
  - [04 - docker in docker example](#04---docker-in-docker-example)
  - [05 - jupyter example](#05---jupyter-example)
  - [06 - cpp example](#06---cpp-example)
  - [07 - oh my zsh](#07---oh-my-zsh)
  - [08 - typescript express](#08---typescript-express)
  - [09 - docker compose](#09---docker-compose)
  - [10 - terraform](#10---terraform)
  - [Resources](#resources)
    - [Issues](#issues)

TODO:

* Where is the .dockerignore rooted?
* A custom devcontainer feature https://github.com/devcontainers/feature-starter (maybe my niceprompt example)
* terraform
* Ability to clone other repos into the workspace
* Build github actions for each container
* Setup my dotfiles in a remote container
* Sharing credentials https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container
* docker caching - to speed up build
* build a custom powershell jupyter build container
* Configure different users.

NOTES:

* Currently `vscode` does not support the nested indirect devcontainers.  Follow example [01_bash_container/README.md](./01_bash_container/README.md) using the cli to build start and attach.  Or use the `./devcontainerctl.sh` script.  
* If you don't map the `.git` folder then you can't use codespaces to change and commit.  

## Getting started

```sh
# install the extension (this is not required on codespaces)
code --install-extension ms-vscode-remote.remote-containers
```

* Use `⌘ + ^ + p` and "Try a development Container Sample"
* Use `⌘ + ^ + p` and "Add development container configuration files"

Select Ubuntu and follow options

```sh
npm install -g @vscode/dev-container-cli  
```

```sh
# github codespaces extension
code --install-extension GitHub.codespaces
```

## Github cli codespaces

```sh
export PAGER=

gh codespace

# on the list it displays the real created time
gh codespace list
```

## Run & Stop

```sh
# start bash devcontainer
./devcontainerctl.sh -n=01_bash_container --no-cache

# stop bash devcontainer
./devcontainerctl.sh -n=01_bash_container --down
```

## 01 - bash development example

Demonstrate a simple bash container with `shellcheck` added.  
Steps [README.md](./01_bash_container/README.md)  

## 02 - powershell development example

Demonstrate a simple `powershell` devcontainer  
Steps [README.md](./02_powershell_container/README.md)  

## 03 - typescript development example

Demonstrate a `typescript` build environment in a devcontainer  
Steps [README.md](./03_typescript_container/README.md)  

## 04 - docker in docker example

Demonstrate `docker in docker` builds in a devcontainer.  
Steps [README.md](./04_docker_in_docker/README.md)  

## 05 - jupyter example

Demonstrate jupyter in a `devcontainer`.  
Steps [README.md](./05_jupyter/README.md)  

## 06 - cpp example

Demonstrate a simple cpp container with `cmake`.  
Steps [README.md](./06_cpp/README.md)  

## 07 - oh my zsh

Demonstrate a simple zsh container using features.  
Steps [README.md](./07_oh_my_zsh/README.md)  

## 08 - typescript express

Demonstrate a simple typescript application with docker in docker support.  
Steps [README.md](./08_typescript_express/README.md)  

## 09 - docker compose

Demonstrate using `docker compose` inside a devcontainer.  
Steps [README.md](./09_docker_compose/README.md)  

## 10 - terraform

Demonstrate a simple terraform container.  
Steps [README.md](./10_terraform/README.md)  

## Resources

* [containers.dev](https://containers.dev/)
* devcontainers.json [json_reference](https://containers.dev/implementors/json_reference/)
* manekinekko/awesome-devcontainers repo [here](https://github.com/manekinekko/awesome-devcontainers)  
* Available Dev Container Features [here](https://containers.dev/features)  
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)
* devcontainer-cli [here](https://code.visualstudio.com/docs/remote/devcontainer-cli)  
* GitHub Codespaces Is Too Cumbersome and Expensive to Replace Local Development
 [here](https://notes.alexkehayias.com/github-codespaces-is-too-slow-and-expensive-to-replace-local-development/)
* devcontainers/cli repo [here](https://github.com/devcontainers/cli)  
* devcontainers-contrib/features repo [here](https://github.com/devcontainers-contrib/features)
* devcontainers/features repo [here](https://github.com/devcontainers/features)
* rocker-org/devcontainer-features repo [here](https://github.com/rocker-org/devcontainer-features/tree/main/src/apt-packages)  

### Issues

* Support multiple developer roles via multiple files in .devcontainer folder #7434 [here](https://github.com/microsoft/vscode-remote-release/issues/7434)
* Support for folders with multiple devcontainer.json files #7548 [here](https://github.com/microsoft/vscode-remote-release/issues/7548)
* Simplify multiple devcontainer creation process. Allow multiple devcontainer.json ,we should be able to select any json and create dev container. #166681 [here](https://github.com/microsoft/vscode/issues/166681)  
