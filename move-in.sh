#!/usr/bin/env bash

for file in $(ls .); do
  echo "Linking '$file'..."
  ln -ns "$(pwd)/$file" "$HOME/.$file" 
done
