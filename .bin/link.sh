#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"

mkdir -p "$BACKUP_DIR"

FILES=(
  .bashrc
  .vimrc
  .gitconfig
  .config/nvim
  .config/bash
  .config/lazygit
)

if [ "${SUDO_USER:-}" ]; then
  TARGET_HOME="$(getent passwd "$SUDO_USER" | cut -d: -f6)"
else
  TARGET_HOME="$HOME"
fi

link_item() {
  src="$1"
  dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/$(echo "$dest" | sed "s|$HOME/||;s|/|_|g").$(date +%Y%m%d%H%M%S)"
  fi

  mkdir -p "$(dirname "$dest")"

  echo "Linking $src -> $dest"
  ln -s "$src" "$dest"
}

for file in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"
  link_item "$src" "$dest"
done

echo "All dotfiles linked!"
