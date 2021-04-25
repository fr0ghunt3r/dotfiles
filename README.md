# Installation guide (dotfiles and packages)

Easy install script for multi-OS environment(Mac OS, Ubuntu and Arch Linux)

This settings would run with ZSH, so you have to install ZSH before start.

Most lines of these dotfiles are from Junegunn's(https://github.com/junegunn/dotfiles), and I really appreciate with it. if any problems with this, tell me about that with this address(antin.choi@gmail.com).

## ZSH Installation:

### Ubuntu

```zsh
apt install zsh
```

### Arch Linux

```zsh
pacman -S zsh
```

## Run installation script

```zsh
./install.zsh --pass={ur_password} # password is needed to give permission to install system packages
```
