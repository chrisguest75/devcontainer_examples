# Hello, World! (hello)

A hello world feature

TODO:

* Push the image to repository.  

NOTES:

* It seems you cannot use the local docker registry.  

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers/feature-starter/hello:1": {
        "version": "latest"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| greeting | Select a pre-made greeting, or enter your own | string | hey |

## Test

```sh
# in the container
/usr/local/bin/hello
```

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/devcontainers/feature-starter/blob/main/src/hello/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._