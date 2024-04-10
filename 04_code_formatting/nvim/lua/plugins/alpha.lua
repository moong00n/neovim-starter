return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
    "                                                                                ",
    "                                                                                ",
    "                                                                                ",
    "                                                                                ",
    [[ ________     _______     ________    ___      ___   ___    _____ ______      ]],
    [[|\   ___  \  |\  ___ \   |\   __  \  |\  \    /  /| |\  \  |\   _ \  _   \    ]],
    [[\ \  \\ \  \ \ \   __/|  \ \  \|\  \ \ \  \  /  / / \ \  \ \ \  \\\__\ \  \   ]],
    [[ \ \  \\ \  \ \ \  \_|/__ \ \  \\\  \ \ \  \/  / /   \ \  \ \ \  \\|__| \  \  ]],
    [[  \ \  \\ \  \ \ \  \_|\ \ \ \  \\\  \ \ \    / /     \ \  \ \ \  \    \ \  \ ]],
    [[   \ \__\\ \__\ \ \_______\ \ \_______\ \ \__/ /       \ \__\ \ \__\    \ \__\]],
    [[    \|__| \|__|  \|_______|  \|_______|  \|__|/         \|__|  \|__|     \|__|]],
    }

    -- set menu items
    dashboard.section.buttons.val = {
      dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
      dashboard.button("w", "  > Find Word", ":Telescope live_grep <CR>"),
      dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "  > Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end
};
