# README

Demonstrate building a devcontainer with renovate

NOTES:

* This is working and builds arm, but some of the tool installation crashes build; curl, git, etc

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

## Renovate

```sh
unset RENOVATE_CONFIG_FILE
export RENOVATE_TOKEN=$(gh auth token)
LOG_LEVEL=debug RENOVATE_PLATFORM=local renovate
```


## Resources

