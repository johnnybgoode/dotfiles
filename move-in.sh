#!/usr/bin/env bash

shopt -s extglob

ROOT_DIR="$(cd "$(dirname "$0")" &>/dev/null && pwd -P)"
EXCLUDES="move-in.sh|ghostty.conf|*.iterm*"

for file in !($EXCLUDES); do
  echo "Linking '$file'..."
  ln -ns "$ROOT_DIR/$file" "$HOME/.$file"
done

mkdir -p "$HOME/.config/ghostty" && ln -s "$ROOT_DIR/ghostty.conf" "$HOME/.config/ghostty/config"

mkdir -p "$HOME/.zshrc.d"

git clone https://github.com/romkatv/zsh-defer.git "$HOME/.zshrc.d/zsh-defer"
