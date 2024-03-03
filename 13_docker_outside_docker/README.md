# README

Demonstrate a simple devcontainer with docker outside docker.  

Demonstrates:

* An example of using docker from a devcontainer.
* Building a volume to share a file into a docker image running with a devcontainer.  
* Using piping trick to build volumes.  

NOTES:

* Use docker on the host

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

```sh
# start devcontainer
./devcontainerctl.sh -n=13_docker_outside_docker

# start devcontainer (rebuild)
./devcontainerctl.sh -n=13_docker_outside_docker --no-cache
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

## Build

If you're running docker outside docker (in a devcontainer). You'll find it difficult to mount paths into the containers when running them. This is because the mount path will need to be provided for the host.
A work around for this is to pipefile into a volume using a container. You can then use the volume as a mount.  

```sh
# create a volume
docker volume create 13_docker_outside_docker

docker volume ls

# build the container to pipe to volume
docker build -f Dockerfile.pipeable -t default_pipeable .

# or with random data
sudo dd if=/dev/urandom of=random.bin bs=1024 count=1
md5sum ./random.bin

# pipe a binary file into the volume
cat ./random.bin | docker run -i -v 13_docker_outside_docker:/myvolume default_pipeable --pipe --target=/myvolume/random.bin

# list volume contents
docker run -i -v 13_docker_outside_docker:/myvolume default_pipeable --list --target=/myvolume

# show contents on the volume
docker run -i -v 13_docker_outside_docker:/myvolume default_pipeable --show --target=/myvolume/random.bin

# file md5 on the volume
docker run -i -v 13_docker_outside_docker:/myvolume default_pipeable --md5 --target=/myvolume/random.bin
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=13_docker_outside_docker --down
```

## Resources

* chrisguest75/docker_examples/34_volume_images [repo](https://github.com/chrisguest75/docker_examples/tree/master/34_volume_images)  
