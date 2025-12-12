#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

set dotenv-load := true

# default lists actions
default:
  @just -f {{ source_file() }} --list

validate:
  #!/usr/bin/env bash
  set -eufo pipefail

  npx --yes --package renovate -- renovate-config-validator --strict

# ***************************************
# scan
# ***************************************
scan:
  #!/usr/bin/env bash
  set -eufo pipefail

  . ./21_renovate/config/.devcontainer.env
  export RENOVATE_REPOSITORIES="chrisguest75/devcontainer_examples"
  LOG_LEVEL=debug npx --yes renovate

scan-local:
  #!/usr/bin/env bash
  set -eufo pipefail

  . ./21_renovate/config/.devcontainer.env
  unset RENOVATE_REPOSITORIES
  RENOVATE_PLATFORM=local npx --yes renovate
