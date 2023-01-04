# README

Demonstrate a simple typescript application with docker in docker support.  

Demonstrates:

* Using features to compose node and docker in docker quickly.  

- [README](#readme)
  - [Start (vscode)](#start-vscode)
  - [Building and Running](#building-and-running)
  - [Stop](#stop)
  - [Resources](#resources)

Used a hygen template to create the express app Ref:[typescript_examples/00_project_templates](https://github.com/chrisguest75/typescript_examples/tree/master/00_project_templates)  

## Start (vscode)

```sh
# start bash devcontainer
./devcontainerctl.sh -n=08_typescript_express

# start bash devcontainer (rebuild)
./devcontainerctl.sh -n=08_typescript_express --no-cache
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Building and Running

```sh
cd 99_express       
npm install       
npm run start:dev  
curl http://localhost:8000   

# using docker in docker
npm run docker:build   
npm run docker:run           
```

## Stop

```sh
# stop devcontainer
./devcontainerctl.sh -n=08_typescript_express --down
```

## Resources

* devcontainers/cli repo [here](https://github.com/devcontainers/cli)  
* devcontainers-contrib/features repo [here](https://github.com/devcontainers-contrib/features)
* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
