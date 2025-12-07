# README

Demonstrate building a devcontainer with renovate

TODO:

* the gh cli is not using creds from host.


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

export RENOVATE_TOKEN=$(gh auth token)
env | sort
LOG_LEVEL=debug RENOVATE_PLATFORM=local npx --yes renovate


export RENOVATE_REPOSITORIES="chrisguest75/devcontainer_examples"
LOG_LEVEL=debug npx --yes renovate
```


## Resources

