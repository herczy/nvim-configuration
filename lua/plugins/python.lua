return {
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap_py = require("dap-python")

			dap_py.setup("~/miniconda3/bin/python3")
			dap_py.test_runner = "pytest"
		end,
	},
	{
		"kmontocam/nvim-conda",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
