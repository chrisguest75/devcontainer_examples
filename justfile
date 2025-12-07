#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

set dotenv-load := true

# default lists actions
default:
  @just -f {{ source_file() }} --list

# ***************************************
# scan
# ***************************************
scan:  
  #!/usr/bin/env bash
  set -eufo pipefail

  npx --yes renovate


scan-local:  
  #!/usr/bin/env bash
  set -eufo pipefail

  unset RENOVATE_REPOSITORIES
  RENOVATE_PLATFORM=local npx --yes renovate



