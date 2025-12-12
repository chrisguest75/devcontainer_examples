#!/bin/bash/env bash
echo "Executing postCreateCommand.sh"

sudo apt update
echo "uname: $(uname -a)"
echo "whoami: $(whoami)"
echo "TERRAFORM_VERSION:${TERRAFORM_VERSION}"

# shellcheck source=/dev/null
. "20_tenv/config/.devcontainer.env"

env | sort

sudo sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" /root/.zshrc
sed -i.bak "s/ZSH_THEME=\"codespaces\"/ZSH_THEME=\"robbyrussell\"/g" ~/.zshrc

# install pre-commit
uv tool install pre-commit

# Install tenv
echo "Installing tenv..."
TENV_VERSION="v4.8.3"
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit 1
wget -q "https://github.com/tofuutils/tenv/releases/download/${TENV_VERSION}/tenv_${TENV_VERSION}_Linux_x86_64.tar.gz"
tar -xzf "tenv_${TENV_VERSION}_Linux_x86_64.tar.gz"
chmod +x tenv
sudo mv tenv /usr/local/bin/
cd - > /dev/null || exit 1
rm -rf "$TMP_DIR"
echo "tenv installed: $(tenv --version)"

# Install and setup Terraform with tenv
echo "Installing Terraform via tenv..."
tenv tf install 1.14.1
tenv tg install 0.94.0

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


# Configure development environment
echo "Configuring development environment..."

# Add tenv helper function to switch versions and update symlinks
cat >> ~/.zshrc << 'EOF'

# Tenv helper functions
tenv-use-tf() {
    if [ -z "$1" ]; then
        echo "Usage: tenv-use-tf <version>"
        echo "Example: tenv-use-tf 1.6.0"
        return 1
    fi

    echo "Installing and switching to Terraform $1..."
    tenv tf install "$1" && tenv tf use "$1"
    TF_VERSION=$(cat ~/.tenv/Terraform/version)
    sudo ln -sf ~/.tenv/Terraform/"$TF_VERSION"/terraform /usr/local/bin/terraform
    echo "Switched to: $(terraform --version)"
}

tenv-use-tg() {
    if [ -z "$1" ]; then
        echo "Usage: tenv-use-tg <version>"
        echo "Example: tenv-use-tg v0.53.0"
        return 1
    fi

    echo "Installing and switching to Terragrunt $1..."
    tenv tg install "$1" && tenv tg use "$1"
    TG_VERSION=$(cat ~/.tenv/Terragrunt/version)
    sudo ln -sf ~/.tenv/Terragrunt/"$TG_VERSION"/terragrunt /usr/local/bin/terragrunt
    echo "Switched to: $(terragrunt --version)"
}

# Tenv aliases for convenience
alias tf-versions='tenv tf list'
alias tf-available='tenv tf list-remote'
alias tg-versions='tenv tg list'
alias tg-available='tenv tg list-remote'
EOF

echo "Environment configuration complete!"
echo ""
echo "Available tools:"
echo "  - tenv: $(tenv --version)"
echo "  - terraform: $(terraform --version | head -1)"
if command -v terragrunt >/dev/null 2>&1; then
    echo "  - terragrunt: $(terragrunt --version)"
else
    echo "  - terragrunt: Not installed (GitHub rate limit)"
fi
if command -v task >/dev/null 2>&1; then
    echo "  - task: $(task --version)"
else
    echo "  - task: Not installed (download failed)"
fi
echo ""
echo "Helper functions added:"
echo "  - tenv-use-tf <version>  # Switch Terraform version"
echo "  - tenv-use-tg <version>  # Switch Terragrunt version"
echo "  - tf-versions            # List installed Terraform versions"
echo "  - tf-available           # List available Terraform versions"
echo "  - tg-versions            # List installed Terragrunt versions"
echo "  - tg-available           # List available Terragrunt versions"

#brew install tenv taskfile
