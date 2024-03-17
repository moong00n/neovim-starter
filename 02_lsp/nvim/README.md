# Minimal Setup

Simple setup for getting started with neovim

## What's included?

- basic file/directory structure (see below)
- `lazy.nvim` plugin manager (https://github.com/folke/lazy.nvim)
- `gruvbox` color scheme (https://github.com/ellisonleao/gruvbox.nvim)
- `telescope` fuzzy finder (https://github.com/nvim-telescope/telescope.nvim)
- `neotree` file browser (https://github.com/nvim-neo-tree/neo-tree.nvim)
- `nvim-treesitter` tree sitter interface (https://github.com/nvim-treesitter/nvim-treesitter)
- `indent-blankline` indent guides (https://github.com/lukas-reineke/indent-blankline.nvim)
- `comment` comment plugin (https://github.com/numToStr/Comment.nvim)
- `lualine` neovim statusline plugin (https://github.com/nvim-lualine/lualine.nvim)
- `mason` package manager (https://github.com/williamboman/mason.nvim)
- `mason-lspconfig` Extension to mason.nvim (https://github.com/williamboman/mason-lspconfig.nvim)
- `nvim-lspconfig` configs for Nvim LSP (https://github.com/neovim/nvim-lspconfig)
- `telescope-ui-select` sets vim.ui.select to telescope. (https://github.com/nvim-telescope/telescope-ui-select.nvim)

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
