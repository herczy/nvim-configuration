return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require("dap")
		local which_key = require("which-key")

		which_key.register({
			d = {
				"Debugger",
				t = { dap.toggle_breakpoint, "Toggle breakpoint" },
				c = { dap.continue, "Continue" },
				r = { dap.run_to_cursor, "Run to cursor" },
			},
		}, { prefix = "<leader>" })
		vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Step Over" })

		local dapui = require("dapui")
		dapui.setup({
			icons = {
				expanded = "⯆",
				collapsed = "⯈",
				circular = "↺",
			},
			mappings = {
				expand = "<CR>",
				open = "o",
				remove = "d",
			},
			sidebar = {
				elements = {
					-- You can change the order of elements in the sidebar
					"scopes",
					"scopes",
					"watches",
				},
				width = 40,
				position = "left", -- Can be "left" or "right"
			},
			tray = {
				elements = {
					"repl",
				},
				height = 10,
				position = "bottom", -- Can be "bottom" or "top"
			},
		})

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
	end,
}
