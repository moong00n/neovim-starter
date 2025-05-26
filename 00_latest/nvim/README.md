My latest neovim config

## What's included?

- basic file/directory structure (see below)
- `lazy.nvim` plugin manager (https://github.com/folke/lazy.nvim)
- `telescope` fuzzy finder (https://github.com/nvim-telescope/telescope.nvim)
- `neotree` file browser (https://github.com/nvim-neo-tree/neo-tree.nvim)
- `nvim-treesitter` tree sitter interface (https://github.com/nvim-treesitter/nvim-treesitter)
- `indent-blankline` indent guides (https://github.com/lukas-reineke/indent-blankline.nvim)
- `comment` comment plugin (https://github.com/numToStr/Comment.nvim)
- `lualine` neovim statusline plugin (https://github.com/nvim-lualine/lualine.nvim)
- `mason` package manager (https://github.com/williamboman/mason.nvim)
- `mason-lspconfig` Extension to mason.nvim (https://github.com/williamboman/mason-lspconfig.nvim)
- `telescope-ui-select` sets vim.ui.select to telescope. (https://github.com/nvim-telescope/telescope-ui-select.nvim)
- `alpha-nvim` custom greeter UI/dashboard (https://github.com/goolord/alpha-nvim)
- `nvim-autopairs` autopair plugin (https://github.com/windwp/nvim-autopairs)
- `nvim-ufo` code folding (https://github.com/kevinhwang91/nvim-ufo)
- `conform` formatter (https://github.com/stevearc/conform.nvim)
- `nvim-cmp` completion plugin (https://github.com/hrsh7th/nvim-cmp)
- `nvim-dap` plugin for DAP, debug adapter protocol (https://github.com/mfussenegger/nvim-dap)
- `mellifuous` color scheme (https://github.com/ramojus/mellifuous.nvim)

## requirements

- Neovim (v0.11.0)
- ripgrep (https://github.com/BurntSushi/ripgrep)
- Nerd Font (optional)

### directory structure

- Lua modules runtime path: `~/.config/nvim/lua on \*nix systems`

```bash
~/.config # not included in this repo ()
    /nvim
        /lsp # lsp configuration files
        /lua # init.lua
            /config  # config .lua files
            /plugins # plugins here (lazy package manager)
            /utils # utility/helper .lua files
        /after
            /ftplugin # language specific options
```
