# ansible

Initial setup for arch-based distros:
```shell
$ ansible-galaxy collection install kewlfft.aur

$ ansible-playbook local.yml -t install --ask-become-pass --ask-vault-pass
```
