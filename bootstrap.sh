#!/bin/bash

# 1. Update and install Ansible
sudo pacman -Syu --noconfirm ansible

# 2. Install Yay
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd ..
    rm -rf yay-bin
fi

# 3. Run the Playbook
# ansible-playbook local.yml --ask-become-pass
