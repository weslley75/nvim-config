return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { "/opt/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				skipFiles = { "<node_internals>/**" },
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}

		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch Current File (pwa-node with ts-node)",
				cwd = vim.fn.getcwd(),
				runtimeArgs = { "-r", "ts-node/register" },
				runtimeExecutable = "node",
				args = { "${file}" },
				sourceMaps = true,
				protocol = "inspector",
				skipFiles = { "<node_internals>/**", "node_modules/**" },
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				},
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
	end,
}
