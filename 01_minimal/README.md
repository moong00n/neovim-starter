# Minimal Setup

Simple setup for getting started with neovim

## What's included?

- basic file/directory structure (see below)
- `lazy.nvim` plugin manager (https://github.com/folke/lazy.nvim)
- `gruvbox` color scheme (https://github.com/ellisonleao/gruvbox.nvim)
- `telescope` fuzzy finder (https://github.com/nvim-telescope/telescope.nvim)
- `neotree` file browser (https://github.com/nvim-neo-tree/neo-tree.nvim)

## requirements

- Neovim (v0.9.0) or the latest neovim nightly
- ripgrep (https://github.com/BurntSushi/ripgrep)
- Nerd Font (optional)

### directory structure

- Lua modules runtime path: `~/.config/nvim/lua on \*nix systems`

```bash
~/.config # not included in this repo ()
    /nvim
        /lua # init.lua
            /config  # config .lua files
            /plugins # plugins here (lazy package manager)
            /utils # utility/helper .lua files
```
