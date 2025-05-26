return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({})

        local function clear_gitsigns_bg()
            local hl_groups = {
                "GitSignsAdd",
                "GitSignsChange",
                "GitSignsDelete",
                "GitSignsTopDelete",
                "GitSignsChangeDelete",
            }

            for _, group in ipairs(hl_groups) do
                local existing = vim.api.nvim_get_hl(0, { name = group })
                vim.api.nvim_set_hl(0, group, {
                    fg = existing.fg,
                    bg = "none",
                    bold = existing.bold,
                    italic = existing.italic,
                    underline = existing.underline,
                })
            end
        end

        -- only disables bg color
        clear_gitsigns_bg()

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = clear_gitsigns_bg,
        })
    end,
}
