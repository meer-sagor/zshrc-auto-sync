#!/bin/bash

# Uninstall Oh My Zsh
echo "Uninstalling Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  sudo chmod 777 "$HOME/.oh-my-zsh/tools/uninstall.sh"
  sh "$HOME/.oh-my-zsh/tools/uninstall.sh"
  echo "Oh My Zsh has been uninstalled."
else
  echo "Oh My Zsh is not installed."
fi

# Remove Zsh configuration files
echo "Removing Zsh configuration files..."
if [ -f "$HOME/.zshrc" ]; then
  rm "$HOME/.zshrc"
  echo "Zsh configuration file (.zshrc) has been removed."
else
  echo "Zsh configuration file (.zshrc) not found."
fi

# Uninstall Zsh
echo "Uninstalling Zsh..."
if [ "$(command -v zsh)" ]; then
  sudo apt-get remove zsh   # Use the appropriate package manager for your system
  sudo apt-get autoremove
  echo "Zsh has been uninstalled."
else
  echo "Zsh is not installed."
fi

echo "Uninstallation process complete."
