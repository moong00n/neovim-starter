return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "ts_ls", "gopls", "html", "clangd" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        -- neovim 0.11 supports lsp natively
        -- "neovim/nvim-lspconfig",
    },
}
