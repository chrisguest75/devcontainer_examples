# README

Demonstrate a simple devcontainer with docker outside docker.  

TODO:



Demonstrates:

*  

NOTES:

* Use docker on the host

## Start (vscode)

```sh
./devcontainerctl.sh -n=13_docker_outside_docker
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Start

```sh
cd 13_docker_outside_docker

docker ps

docker images

docker pull ubuntu:22.04
```

## Resources

