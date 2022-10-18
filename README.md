# Archvim 
A stable and simple to extend Neovim configuration. Archvim is a starting point for you to learn how to configure your Neovim easily and without unnecessary complexity. Just read the source code a little and you should be able to start using and configuring it your way.
## Requirements 
- neovim 0.8+
- gcc
- make
- fzf
- ripgrep
- lazygit
- treesitter
- lua
- nodejs
- python
- xsel (X11) or wl-clipboard (Wayland). On mac `pbcopy` should be builtin
- scoop (A package manager to install dependencies above in Windows)
- nerd fonts (to render glyphs properly). Install one according to your operating system and configure your terminal to use it
## Install Neovim using package manager
**NOTE** If your distro is not listed here, check if your distro has Neovim and its version is 0.8+
### Arch Linux
```bash
pacman -S neovim
```
### Fedora
```bash
sudo dnf install neovim 
```
### OpenSUSE
```bash
sudo zypper install neovim
```
### Windows
First, install the [scoop](https://scoop.sh/) package manager or use whichever you prefer. The goal is to able to install the necessary dependencies.
```bash
scoop bucket add extras
scoop install vcredist2022
scoop install neovim
```
## Install Neovim from source
If you prefer or your package manager has the outdated version, installing from source is ideal.

**NOTE** Verify the require [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites) for your system
```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install
```
## Install Dependencies
### Arch Linux
```bash
sudo pacman -S gcc make fzf ripgrep lazygit tree-sitter lua nodejs python xsel
```
### Ubuntu
```bash
sudo apt install gcc make ripgrep tree-sitter lua nodejs python3 xsel
```
**NOTE** lazygit is not available in the official repositories. Check the installation method for your distro
### Fedora
```bash
sudo dnf install gcc make ripgrep libtree-sitter lua nodejs python3 xsel
```
### OpenSUSE
```bash
sudo zypper install gcc make ripgrep tree-sitter lua nodejs18 python xsel
```
### Windows
**NOTE** If you have already installed [scoop](https://scoop.sh) in steps above
```bash
scoop install sudo gcc make fzf ripgrep lua nodejs python
```
Lazygit
```bash
scoop bucket add extras
scoop install lazygit
```
Tree-sitter
```bash
scoop install https://github.com/ShuguangSun/sgs-scoop-bucket/blob/master/bucket/tree-sitter.json
```
## Install the config
### GNU/Linux
Make sure to remove or move your current `nvim` directory
```bash
git clone https://github.com/mathstylish/Archvim.git ~/.config/nvim
```
Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

