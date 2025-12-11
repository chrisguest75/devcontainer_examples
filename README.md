# DevContainer Examples

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)  
  
## Conventional Commits

NOTE: This repo has switched to [conventional commits](https://www.conventionalcommits.org/en/v1.0.0). It requires `pre-commit` and `commitizen` to help with controlling this.  

```sh
# install pre-commmit (prerequisite for commitizen)
brew install pre-commit
brew install commitizen
# conventional commits extension
code --install-extension vivaxy.vscode-conventional-commits

# install hooks
pre-commit install --hook-type commit-msg --hook-type pre-push
```

[![Repository](https://skillicons.dev/icons?i=docker,bash,linux)](https://skillicons.dev)

A repository for showing examples of how to use `devcontainers`.  

The Remote - Containers extension lets you use a Docker container as a full-featured development environment. Whether you deploy to containers or not, containers make a great development environment because you can:

* Develop with a consistent, easily reproducible toolchain on the same operating system you deploy to.
* Quickly swap between different, separate development environments and safely make updates without worrying about impacting your local machine.
* Make it easy for new team members / contributors to get up and running in a consistent development environment.
* Try out new technologies or clone a copy of a code base without impacting your local setup.

Based on my examples from docker_examples [41_remote_containers](https://github.com/chrisguest75/docker_examples/tree/master/41_remote_containers) and [41_nodejs_remote_devcontainer](https://github.com/chrisguest75/docker_examples/tree/master/41_nodejs_remote_devcontainer).  

- [DevContainer Examples](#devcontainer-examples)
  - [Conventional Commits](#conventional-commits)
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
  - [10 - terraform](#10---terraform)
  - [11 - aws posh](#11---aws-posh)
  - [13 - docker outside docker](#13---docker-outside-docker)
  - [14 - python pipenv](#14---python-pipenv)
  - [15 - ARM](#15---arm)
  - [16 - Node Mongo](#16---node-mongo)
  - [Resources](#resources)
    - [Issues](#issues)

NOTES:

* If you don't map the `.git` folder then you can't use codespaces to change and commit.  
* If git is not using credentials off host then check if ssh-agent is running.  
* You can now very easily use the Remote Containers extension to open the containers.  
* There is a nix feature to use instead of brew on arm.
* `uv` can be installed through nix
* ~~Currently `vscode` does not support the nested indirect devcontainers.  Follow example [01_bash_container/README.md](./01_bash_container/README.md) using the cli to build start and attach.  Or use the `./devcontainerctl.sh` script.~~

## Getting started

```sh
# install the extension (this is not required on codespaces)
code --install-extension ms-vscode-remote.remote-containers
```

* Use `⌘ + ^ + p` and "Try a development Container Sample"
* Use `⌘ + ^ + p` and "Add development container configuration files"

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

* Use `⌘ + ^ + p` and "Dev containers: Rebuild and reopen in a container"  

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

## 10 - terraform

Demonstrate a simple terraform container.  
Steps [README.md](./10_terraform/README.md)  

## 11 - aws posh

Demonstrate a simple devcontainer with `powershell` and `awscli` added.  
Steps [README.md](./11_aws_posh/README.md)  

## 13 - docker outside docker

Demonstrate a simple devcontainer with docker outside docker.  
Steps [README.md](./13_docker_outside_docker/README.md)  

## 14 - python pipenv

Demonstrate a simple python container.
Steps [README.md](./14_python_pipenv/README.md)  

## 15 - ARM

Demonstrate building a devcontainer in ARM architecture on x86.  
Steps [README.md](./15_arm/README.md)  

## 16 - Node Mongo

Demonstrate building a mongodb devcontainer.  
Steps [README.md](./16_node_mongo/README.md)  

## Resources

* [containers.dev](https://containers.dev/)
* Containers Features [here](https://containers.dev/features)
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
* Dev Container CLI NPM [here](https://www.npmjs.com/package/@devcontainers/cli)
* Dev Container CLI Repo [here](https://github.com/devcontainers/cli)
* Dev Container Features reference [here](https://containers.dev/implementors/features/)  
* mcr.microsoft.com/devcontainers/base tags [here](https://mcr.microsoft.com/v2/vscode/devcontainers/base/tags/list)
