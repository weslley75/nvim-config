return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      git = {
        ignore = false, -- Show files that are in .gitignore
      },
      renderer = {
        icons = {
          git_placement = "before",
          show = {
            git = true,
          },
        },
        highlight_git = true,
        special_files = {},
        symlink_destination = true,
        indent_markers = {
          enable = false,
        },
      },
      filters = {
        dotfiles = false, -- Show dotfiles
        git_ignored = false,
      },
    })

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
