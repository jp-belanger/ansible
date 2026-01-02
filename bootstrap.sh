#!/bin/bash

# Update and install Ansible
sudo pacman -Syu --noconfirm base-devel git ansible

# Install Yay
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd ..
    rm -rf yay-bin
fi

# Install ansible aur helper module
ansible-galaxy collection install kewlfft.aur

# Run the Playbook
ansible-playbook local.yml -t install --ask-become-pass --ask-vault-pass
