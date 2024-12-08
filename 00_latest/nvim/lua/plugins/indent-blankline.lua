return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local indent = "passive"

        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "passive", { fg = "#3E3E3E" })
        end)

        require("ibl").setup({
            scope = { enabled = false },
            indent = { highlight = indent },
        })
    end,
}
