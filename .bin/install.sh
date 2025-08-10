#!/bin/bash
set -euo pipefail

apt install -y fzf silversearcher-ag jq

echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# lazygit --use-config-file=~/.config/lazygit/config.yml

echo "Installed lazygit version ${LAZYGIT_VERSION}."

echo "Installing nvm and Node.js 22..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
corepack enable pnpm
echo "Instaled Node.js $(node -v) and pnpm $(pnpm -v)."
