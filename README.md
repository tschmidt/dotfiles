# tschmidt dotfiles

This project contains files that set up my personal development environment.

**Warning:** If you want to try these dotfiles, you should fork this repository, review the code within, and remove anything you don't want or need. You **should not** blindly use these files unless you know what they will do. Use at your own risk.

## Installation

```
git clone git@github.com:tschmidt/dotfiles.git
cd dotfiles
./install
```

## Updates

If the dotbot configuration needs to be changed, update install.conf.yaml and run `./install` from the dotfiles directory.

If adding new Vim/Neovim plugins, create a new directory in `nvim/lua/custom/plugins`. The format should be to create a subfolder named after the new plugin with an `init.lua` file inside. Be sure to comment at the top of the file, including a brief description of the plugin and a link to its homepage.

```
-- A really awesome plugin
-- https://github.com/author/plugin
```

When you open NeoVim the next time, Lazy will automatically install the new plugin(s).

## The Essentials

- [dotbot](https://github.com/anishathalye/dotbot): A tool that bootstraps dotfiles
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim): A launch point for your personal nvim configuration
- [Homebrew](https://brew.sh/): The missing package manager for macOS (or Linux)
- [NeoVim](https://neovim.io/): A hyperextensible Vim-based text editor
- [Oh My Zsh](https://ohmyz.sh/): A delightful and open-source framework for Zsh
- [iTerm2](https://iterm2.com/): macOS Terminal replacement
- Various vim/nvim plugins that bring me development joy (see nvim/lua/custom/plugins for a full list).