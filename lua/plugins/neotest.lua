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
				args = { "--log-level", "DEBUG", "-vv" },
				runner = "pytest",
				python = "python",
				pytest_discover_instances = true,
			}),
		}
		local neotest = require("neotest")
		local which_key = require("which-key")

		neotest.setup({ adapters = adapters })

		which_key.register({
			t = {
				"Test execution",
				t = {
					neotest.summary.toggle,
					"Toggle summary",
				},
				r = {
					neotest.run.run,
					"Run nearest tests",
				},
				d = {
					function()
						neotest.run.run({ strategy = "dap" })
					end,
					"Debug nearest tests",
				},
				O = {
					neotest.output.open,
					"Open output",
				},
				o = {
					neotest.output_panel.open,
					"Open output panel",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
