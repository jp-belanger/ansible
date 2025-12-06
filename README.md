# ansible

## Install
```shell
# install dependencies
sudo pacman -S --needed git base-devel ansible

# Clone and build yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# Clean up
cd .. && rm -rf yay

# setup ansible aur helper
ansible-galaxy collection install kewlfft.aur

# execute the playbook
ansible-playbook local.yml -t install --ask-become-pass --ask-vault-pass
```
