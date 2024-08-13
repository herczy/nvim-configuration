return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local wk = require("which-key")
		local ntc = require("neo-tree.command")
		wk.add({
			{
				"<leader>nt",
				function()
					ntc.execute({})
				end,
				desc = "Open filesystem tree",
			},
			{ "<leader>n", desc = "Neotree commands" },
		})
	end,
}
