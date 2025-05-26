return {
    "ramojus/mellifluous.nvim",
    config = function()
        require("mellifluous").setup({
            styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
                main_keywords = { bold = true },
                other_keywords = { italic = true },
                strings = { italic = true }
            },
        })

        vim.cmd.colorscheme('mellifluous')

        vim.opt.cursorline = true
        vim.opt.cursorlineopt = "number"

        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#2e2e2e' })
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'white' })
    end
}
