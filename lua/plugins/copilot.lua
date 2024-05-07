return {
  "github/copilot.vim",
  dependencies = {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
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
