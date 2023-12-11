#!/bin/bash

# Check if Zsh is installed
if [ -z "$(command -v zsh)" ]; then
    echo "Zsh is not installed on your machine."

    # Prompt to install Zsh
    read -p "Do you want to install Zsh? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        sudo apt-get update
        sudo apt-get install -y zsh
        chsh -s $(which zsh)
        echo "Zsh installed successfully. Please restart your terminal."
    else
        echo "Zsh not installed. Exiting."
        exit 1
    fi
fi

# Check if Oh-My-Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh-My-Zsh is not installed on your machine."

    # Prompt to install Oh-My-Zsh
    read -p "Do you want to install Oh-My-Zsh? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "Oh-My-Zsh installed successfully. Please restart your terminal."
    else
        echo "Oh-My-Zsh not installed. Exiting."
        exit 1
    fi
fi

echo "Zsh and Oh-My-Zsh are installed on your machine."
