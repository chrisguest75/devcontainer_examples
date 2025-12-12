#!/bin/bash/env bash
echo "Executing postCreateCommand.sh"
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"

sudo sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" /root/.zshrc
sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" ~/.zshrc

# install pre-commit
uv tool install pre-commit

# Install Taskfile (Task)
echo "Installing Taskfile..."
TASK_VERSION=v3.45.5
if [ -n "$TASK_VERSION" ]; then
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR" || exit 1
    if wget -q "https://github.com/go-task/task/releases/download/${TASK_VERSION}/task_linux_amd64.tar.gz"; then
        tar -xzf "task_linux_amd64.tar.gz"
        chmod +x task
        sudo mv task /usr/local/bin/
        cd - > /dev/null || exit 1
        rm -rf "$TMP_DIR"
        echo "Taskfile installed: $(task --version)"
    else
        cd - > /dev/null || exit 1
        rm -rf "$TMP_DIR"
        echo "Warning: Taskfile download failed. Skipping..."
    fi
else
    echo "Warning: Could not determine Taskfile version. Skipping..."
fi
