return {
  "github/copilot.vim",
  dependencies = {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "main",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("CopilotChat").setup()
      end,
    },
  },
  config = function()
    vim.cmd([[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]])
  end,
}

-- return {
--   {
--     "sourcegraph/sg.nvim",
--     dependencies = { "nvim-lua/plenary.nvim" },
--
--     -- If you have a recent version of lazy.nvim, you don't need to add this!
--     build = "nvim -l build/init.lua",
--     config = function()
--       require("sg").setup()
--     end,
--   },
-- }
