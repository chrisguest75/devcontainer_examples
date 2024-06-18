# README

Demonstrate a simple python container.

Demonstrates:

* environment variables
* vscode extensions
* packages installed into the container
* overriding default shell from bash to zsh

NOTES:

* `oh-my-zsh` is installed by default.
* home folder is `/home/vscode`

## Start (vscode)

* You can now very easily use the Remote Containers extension to open the containers.  
* If you don't map the `.git` folder then you can't use codespaces to change and commit.  

## Run tests

```sh
brew install cookiecutter
echo $DEVCONTAINER_TYPE


cookiecutter $(pwd)/14_python_pipenv/01_simple_cli_cookiecutter

export PIPENV_VENV_IN_PROJECT=1
python --version
pipenv install
cp .env.template .env
pipenv run start --test
```

## Resources

* codespaces-multi-repository-monorepo-scenarios blog [here](https://github.blog/2022-04-20-codespaces-multi-repository-monorepo-scenarios/)  
* integrated-terminal config [here](https://code.visualstudio.com/docs/editor/integrated-terminal)  
