return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<leader>/",
        block = "<leader>*",
      },
      opleader = {
        line = "<leader>/",
        block = "<leader>*",
      },
      mappings = {
        basic = true,
        extra = false,
      },
    })
  end,
}
