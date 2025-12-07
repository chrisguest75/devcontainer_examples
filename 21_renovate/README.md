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



LOG_LEVEL=debug RENOVATE_PLATFORM=local RENOVATE_TOKEN=dummy npx --yes renovate

LOG_LEVEL=debug RENOVATE_PLATFORM=local npx --yes renovate
```


## Resources

