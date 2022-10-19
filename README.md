# Archvim 
A stable and simple to extend Neovim configuration. Archvim is a starting point for you to learn how to configure your Neovim easily and without unnecessary complexity. Just read the source code a little and you should be able to start using and configuring it your way.
## Install Neovim 0.8 using package manager
**NOTE** It's not the wrong way, but if you're going to install using a package manager, it's worth checking out the [section](#install-neovim-from-source) before proceeding.
**NOTE** If your distro is not listed here, check if your distro has Neovim and its version is 0.8+ or [install from source](#install-neovim-from-source)
### Arch Linux
```sh
pacman -S neovim
```
### Fedora
```sh
sudo dnf install neovim 
```
### OpenSUSE
```sh
sudo zypper install neovim
```
### Windows
First, install the [scoop](https://scoop.sh/) package manager or use whichever you prefer. The goal is to be able to install the necessary dependencies.
```sh
scoop bucket add extras
scoop install vcredist2022
scoop install neovim
```
## Install Neovim from source
You can install Neovim with your package manager e.g. brew, apt, pacman etc.. but remember that when you update your packages Neovim may be upgraded to a newer version.

If you would like to make sure Neovim only updates when you want it to than I recommend installing from source:

**NOTE** Verify the require [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites) for your system
```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install
```
## Install Dependencies
### Arch Linux
```sh
sudo pacman -S gcc make fzf ripgrep lazygit tree-sitter lua nodejs python xsel
```
### Ubuntu
```sh
sudo apt install gcc make ripgrep tree-sitter lua nodejs python3 xsel
```
**NOTE** lazygit is not available in the official repositories. Check the installation method for your distro
### Fedora
```sh
sudo dnf install gcc make ripgrep libtree-sitter lua nodejs python3 xsel
```
### OpenSUSE
```sh
sudo zypper install gcc make ripgrep tree-sitter lua nodejs18 python xsel
```
### Windows
**NOTE** If you have already installed [scoop](https://scoop.sh) in steps above
```sh
scoop install sudo gcc make fzf ripgrep lua nodejs python
```
Lazygit
```sh
scoop bucket add extras
scoop install lazygit
```
Tree-sitter
```sh
scoop install https://github.com/ShuguangSun/sgs-scoop-bucket/blob/master/bucket/tree-sitter.json
```
## Install the config
### GNU/Linux
Make sure to remove or move your current `nvim` directory
```sh
git clone https://github.com/mathstylish/Archvim.git ~/.config/nvim
```
Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)
### Windows
**NOTE** Make sure to remove or move your current `nvim` directory

By default, the Neovim configuration directory is located at `$env:LOCALAPPDATA\nvim`. So we can simplify this by storing the configuration in `$env:USERPROFILE\.config` and then creating a link to the default directory.
Now open your PowerShell and run:
```sh
mkdir $env:USERPROFILE\.config
git clone https://github.com/mathstylish/Archvim $env:USERPROFILE\.config\nvim
sudo New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim\" -Target "$env:USERPROFILE\.config\nvim\"
```
Now if you need to access the config directory, just access the directory $env:USERPROFILE/.config\nvim

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```sh
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for wayland
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```

We will also need `ripgrep` for Telescope to work:

- Ripgrep

  ```sh
  sudo apt install ripgrep
  ```

**NOTE** make sure you have [node](https://nodejs.org/en/) installed

## Fonts

I recommend using the following repo to get a "Nerd Font" (Font that supports icons)

[getnf](https://github.com/ronniedroid/getnf)
