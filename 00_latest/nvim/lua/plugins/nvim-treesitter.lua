return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "go", "javascript", "html", "markdown", "typescript", "tsx", "json" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
