return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")

		wk.register({
			["f"] = { name = "Find" },
			["l"] = { name = "LSP" },
			["d"] = { name = "Debug" },
			["g"] = { name = "Git" },
			["w"] = { name = "Workspace", label = "Workspace" },
			["b"] = { name = "Buffer" },
			["x"] = { name = "Trouble" },
		}, {
			prefix = "<leader>",
		})

		wk.register({
			["<leader>"] = { name = "Leader" },
			["<space>"] = { name = "Leader" },
			["g"] = { name = "Go to" },
		}, {
			prefix = "",
		})
	end,
}
