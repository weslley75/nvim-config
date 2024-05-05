return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.tsserver.setup({
			--  capabilities = capabilities
			-- })

			require("typescript-tools").setup({
				settings = {
					tsserver_plugins = {
						"@styled/typescript-styled-plugin",
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = function(desc)
						return { buffer = ev.buf, desc = desc }
					end
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Show hover"))
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
					vim.keymap.set(
						"n",
						"<space>wr",
					vim.lsp.buf.remove_workspace_folder,
						opts("Remove workspace folder")
					)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts("List workspace folders"))
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
					vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts("Rename"))
					vim.keymap.set({ "n", "v" }, "<space>la", vim.lsp.buf.code_action, opts("Code action"))
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("References"))
				end,
			})
		end,
	},
}
