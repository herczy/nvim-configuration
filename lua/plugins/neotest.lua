return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
				args = { "--log-level", "DEBUG", "-vv", "--color=no" },
				runner = "pytest",
				python = "python",
				pytest_discover_instances = true,
			}),
		}
		local neotest = require("neotest")
		local which_key = require("which-key")

		neotest.setup({ adapters = adapters, output = { enabled = true, open_on_run = false } })

		which_key.add({
			{ "<leader>t", desc = "Test execution" },
			{ "<leader>tt", neotest.summary.toggle, desc = "Toggle summary" },
			{ "<leader>tr", neotest.run.run, desc = "Run nearest tests" },
			{
				"<leader>td",
				function()
					neotest.run.run({ strategy = "dap" })
				end,
				desc = "Debug nearest tests",
			},
			{ "<leader>to", neotest.output_panel.open, desc = "Open output panel" },
		})
	end,
}
