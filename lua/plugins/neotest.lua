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
				-- Extra arguments for nvim-dap configuration
				-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
				dap = { justMyCode = false },
				-- Command line arguments for runner
				-- Can also be a function to return dynamic values
				args = { "--log-level", "DEBUG", "-vv" },
				-- Runner to use. Will use pytest if available by default.
				-- Can be a function to return dynamic value.
				runner = "pytest",
				-- Custom python path for the runner.
				-- Can be a string or a list of strings.
				-- Can also be a function to return dynamic value.
				-- If not provided, the path will be inferred by checking for
				-- virtual envs in the local directory and for Pipenev/Poetry configs
				python = "python",
				-- Returns if a given file path is a test file.
				-- NB: This function is called a lot so don't perform any heavy tasks within it.
				-- is_test_file = function(file_path)
				--   return file_path:match('test_[a-zA-Z0-9_].py$') ~= nil;
				-- end,
				-- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
				-- instances for files containing a parametrize mark (default: false)
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
