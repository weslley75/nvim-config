return {
	"declancm/cinnamon.nvim",
	config = function()
		require("cinnamon").setup({
			extra_keymaps = true,
      override_keymaps = true,
			scroll_limit = -1,
		})
	end,
}
