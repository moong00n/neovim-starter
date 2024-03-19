return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- set header
        dashboard.section.header.val = {
          "                                                                                          ",
          "                                                                                          ",
          " ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗     ███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗",
          "██╔════╝██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝     ████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║",
          "██║     ██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║",
          "██║     ██║   ██║██║  ██║██║██║╚██╗██║██║   ██║    ██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║",
          "╚██████╗╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝    ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║",
          " ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝",
          "                                                                                          ",
        }

        -- set menu items
        dashboard.section.buttons.val = {
            dashboard.button( "n", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
            dashboard.button( "w", "  > Find Word", ":Telescope live_grep <CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "q", "  > Quit", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end
};
