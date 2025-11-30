#!/usr/bin/env bash

for file in $(ls . | grep -v "move-in"); do
  echo "Linking '$file'..."
  ln -ns "$(pwd)/$file" "$HOME/.$file" 
done
