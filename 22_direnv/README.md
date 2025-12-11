# DIRENV

[.devcontainer/22_direnv/README.md](../.devcontainer/22_direnv/README.md).  

## Tests

```sh
cd 22_direnv/env1
echo $MY_ENVIRONMENT_VARIABLE
echo $ENVIRONMENT1

cd ../../22_direnv/env2
echo $MY_ENVIRONMENT_VARIABLE
echo $ENVIRONMENT2

cd ../../22_direnv/env1
echo $MY_ENVIRONMENT_VARIABLE
echo $ENVIRONMENT1

cd ..
echo $MY_ENVIRONMENT_VARIABLE
echo $ENVIRONMENT1
```