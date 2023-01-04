# README

Demonstrate a simple devcontainer with `powershell` and `awscli` added.  

TODO:

* configure oh-my-posh
* test aws
*  -e AWS_PROFILE=$AWS_PROFILE -e AWS_REGION=$AWS_REGION 

Demonstrates:

* environment variables
* Sharing in credentials for AWS
* 

NOTES:

* `oh-my-zsh` is installed by default.
* `oh-my-posh`
* home folder is `/home/vscode`

## Example

Based on my examples from shell_examples:

## Start (vscode)

```sh
./devcontainerctl.sh -n=11_aws_posh       
```

Use `⌘ + ^ + p` and "Dev Containers: Attach to a running container"

Add `/workspaces/devcontainer_examples` as a workspace to the new vscode editor.  

```sh
cd /workspaces/devcontainer_examples
```

## Start

```sh
pwsh
cd 11_aws_posh
./install.ps1
```

## Resources

