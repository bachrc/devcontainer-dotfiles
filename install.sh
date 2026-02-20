#!/bin/bash

force_color_prompt=yes

# We ensure the most important folders are created
mkdir -p ~/.local/bin
mkdir -p ~/.config

# We install useful binaries
bash ./utilities.sh

# Include aliases
cp ./config/.bash_aliases ~/
echo 'source ~/.bash_aliases' >> ~/.bashrc

# Add starship configuration
cp ./config/starship.toml ~/.config/