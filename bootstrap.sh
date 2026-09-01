#!/usr/bin/env bash

set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Update and install Ansible
sudo pacman -Syu --noconfirm base-devel git ansible

# Install Yay
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    build_dir="$(mktemp -d)"
    trap 'rm -rf -- "$build_dir"' EXIT

    git clone https://aur.archlinux.org/yay-bin.git "$build_dir/yay-bin"
    (
        cd "$build_dir/yay-bin"
        makepkg -si --noconfirm
    )

    rm -rf -- "$build_dir"
    trap - EXIT
fi

# Install Ansible AUR helper module
ansible-galaxy collection install kewlfft.aur

# Run the Playbook
ansible-playbook local.yml -t install --ask-become-pass --ask-vault-pass
