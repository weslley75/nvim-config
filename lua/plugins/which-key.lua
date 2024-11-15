return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.nvim",
  },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.add({
      -- Leader groups
      { "<leader>f", group = "Find" },
      { "<leader>l", group = "LSP" },
      { "<leader>d", group = "Debug" },
      { "<leader>g", group = "Git" },
      { "<leader>w", group = "Workspace" },
      { "<leader>b", group = "Buffer" },
      { "<leader>x", group = "Trouble" },

      -- Non-leader groups
      { "<leader>", group = "Leader" },
      { "<space>", group = "Leader" },
      { "g", group = "Go to" },
    })
  end,
}
