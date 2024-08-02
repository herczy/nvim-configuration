return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim", "folke/which-key.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local which_key = require("which-key")

			which_key.add({
				{ "<leader>f", desc = "Fuzzy finder" },
				{ "<leader>fv", builtin.treesitter, desc = "Find entities" },
				{ "<leader>fg", builtin.live_grep, desc = "Live grep" },
				{ "<leader>fb", builtin.buffers, desc = "Buffers" },
				{ "<leader>fh", builtin.help_tags, desc = "Help" },
				{ "<leader>fk", builtin.man_pages, desc = "Man pages" },
				{ "<leader><leader>", builtin.find_files, desc = "Find files" },
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
