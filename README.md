# DevContainer Examples

[![Repository](https://skillicons.dev/icons?i=docker,bash,linux)](https://skillicons.dev)

A repository for showing examples of how to use `devcontainers`.  

The Remote - Containers extension lets you use a Docker container as a full-featured development environment. Whether you deploy to containers or not, containers make a great development environment because you can:

* Develop with a consistent, easily reproducible toolchain on the same operating system you deploy to.
* Quickly swap between different, separate development environments and safely make updates without worrying about impacting your local machine.
* Make it easy for new team members / contributors to get up and running in a consistent development environment.
* Try out new technologies or clone a copy of a code base without impacting your local setup.

Based on my examples from docker_examples [41_remote_containers](https://github.com/chrisguest75/docker_examples/tree/master/41_remote_containers) and [41_nodejs_remote_devcontainer](https://github.com/chrisguest75/docker_examples/tree/master/41_nodejs_remote_devcontainer).  

TODO:

* Ability to clone other repos into the workspace
* Build github actions for each container
* How does a local build work with monorepo config?  vscode extension - GitHub.codespaces
* Setup my dotfiles in a remote container
* Sharing credentials https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container
* docker caching - to speed up build
* build a cutom powershell jupyter build container

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
devcontainer build ./.devcontainer/01_bash_container  
```

```sh
# github codespaces extension
code --install-extension GitHub.codespaces
```

## github cli

```sh
export PAGER=

gh codespace

# on the list it displays the real created time
gh codespace list
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

## Resources

* [containers.dev](https://containers.dev/)
* devcontainers.json [json_reference](https://containers.dev/implementors/json_reference/)
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)
* devcontainer-cli [here](https://code.visualstudio.com/docs/remote/devcontainer-cli)  
* https://notes.alexkehayias.com/github-codespaces-is-too-slow-and-expensive-to-replace-local-development/
