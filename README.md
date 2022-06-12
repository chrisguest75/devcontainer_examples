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

* Setup my dotfiles in a remote container
* bash development with shellcheck etc
* Typescript dev
* monorepos
* default vscode extensions
* Sharing credentials https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container
* docker caching?

## Getting started

```sh
# install the extension
code --install-extension ms-vscode-remote.remote-containers
```



Use `⌘ + ^ + p` and "Try a development Container Sample"

Use `⌘ + ^ + p` and "Add development container configuration files"

Select Ubuntu and follow options


## 01 - Simple setup for bash development


Steps [README.md](./00_cheatsheet/README.md)  


## Resources

* https://containers.dev/
* https://containers.dev/implementors/json_reference/
* devcontainers and monorepos https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/

* cli https://code.visualstudio.com/docs/remote/devcontainer-cli