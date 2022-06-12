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
* Passing secrets into the container
* How does a local build work with monorepo config?
* Setup my dotfiles in a remote container
* Typescript dev - hygen example
* Sharing credentials https://code.visualstudio.com/docs/remote/containers#_sharing-git-credentials-with-your-container
* docker caching?

## Getting started

```sh
# install the extension (this is not required on codespaces)
code --install-extension ms-vscode-remote.remote-containers
```

* Use `⌘ + ^ + p` and "Try a development Container Sample"
* Use `⌘ + ^ + p` and "Add development container configuration files"

Select Ubuntu and follow options

## 01 - bash development example

Demonstrate a simple bash container with `shellcheck` added.  
Steps [README.md](./01_bash_container/README.md)  

## 02 - powershell development example

Steps [README.md](./02_powershell_container/README.md)  

## 03 - typescript development example

Steps [README.md](./03_typescript_container/README.md)  

## Resources

* [containers.dev](https://containers.dev/)
* devcontainers.json [json_reference](https://containers.dev/implementors/json_reference/)
* codespaces-multi-repository-monorepo-scenarios [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)
* cli https://code.visualstudio.com/docs/remote/devcontainer-cli