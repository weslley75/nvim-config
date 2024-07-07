return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})

    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<Leader>e", function()
      api.tree.toggle({
        path = vim.fn.expand("%:p"),
        find_file = true,
        focus = true,
      })
    end, { desc = "Toggle tree" })
  end,
}
