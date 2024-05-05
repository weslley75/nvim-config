return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha, dashboard = require("alpha"), require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.footer.val = {
      "  ,-.       _,---._ __  / \\  ",
      " /  )    .-'       `./ /   \\ ",
      "(  (   ,'            `/    /|",
      " \\  `-\"             \\'\\   / |",
      "  `.              ,  \\ \\ /  |",
      "   /`.          ,'-`----Y   |",
      "  (            ;        |   '",
      "  |  ,-.    ,-'         |  / ",
      "  |  | (   |            | /  ",
      "  )  |  \\  `.___________|/   ",
      "  `--'   `--'                ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end,
}
