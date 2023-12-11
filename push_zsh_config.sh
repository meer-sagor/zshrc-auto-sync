#!/bin/bash

FILE_PATH=".zshrc"
# shellcheck disable=SC2046
cd `dirname "$0"`

cp "$HOME/$FILE_PATH" .

git add .

git commit -m "Sync zsh configs"

git push origin
