return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    -- Configuração básica
    require("which-key").setup({
      plugins = {
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      -- Janela popup
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      -- Outras configurações
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      -- Substituir ignore_missing (obsoleto) por filter
      filter = function(mapping)
        return mapping.desc ~= nil
      end,
      show_help = true,
      show_keys = true,
    })

    -- Registrando grupos básicos com o novo formato recomendado
    local which_key = require("which-key")
    which_key.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>f", group = "Find/Files" },
      { "<leader>l", group = "LSP" },
      { "<leader>g", group = "Git" },
      { "<leader>d", group = "Debug" },
      { "<leader>e", group = "Explorer" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>s", group = "Session" },
      { "<leader>t", group = "Test" },
      { "<leader>w", group = "Window/Workspace" },
      { "<leader>x", group = "Trouble/Diagnostics" },
    })
    
    -- Subgrupos para LSP
    which_key.add({
      { "<leader>lf", group = "Format" },
      { "<leader>lr", group = "Refactor" },
      { "<leader>ld", group = "Diagnostics" },
      { "<leader>lw", group = "Workspace" },
    })
    
    -- Grupos sem leader
    which_key.add({
      { "g", group = "Go to" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
      { "z", group = "Fold" },
    })
  end,
}
