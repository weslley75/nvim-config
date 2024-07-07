return {
  "declancm/cinnamon.nvim",
  config = function()
    require("cinnamon").setup({
      keymaps = {
        extra = true,
      },
    })
  end,
}
