#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "$0")" &> /dev/null && pwd -P)"

for file in $(ls "$ROOT_DIR" | grep -v "move-in" | grep -v "ghostty.conf"); do
  echo "Linking '$file'..."
  ln -ns "$ROOT_DIR/$file" "$HOME/.$file" 
done

mkdir -p "$HOME/.config/ghostty" && ln -s "$ROOT_DIR/ghostty.conf" "$HOME/.config/ghostty/config"
