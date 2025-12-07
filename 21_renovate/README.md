# README

Demonstrate building a devcontainer with renovate

TODO:

* the gh cli is not using creds from host.


NOTES:

* This is working and builds arm, but some of the tool installation crashes build; curl, git, etc

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

## Renovate

Validate the configuration

```sh
npx --yes --package renovate -- renovate-config-validator --strict
```

Detect out-of-date components.

```sh
# get the token on the host and copy it into devcontainer
export RENOVATE_TOKEN=$(gh auth token)
echo "export RENOVATE_TOKEN=$(gh auth token)"

# look at suggested upgrades
LOG_LEVEL=debug RENOVATE_PLATFORM=local npx --yes renovate

# raise PR
export RENOVATE_REPOSITORIES="chrisguest75/devcontainer_examples"
LOG_LEVEL=debug npx --yes renovate
```

## Resources

