return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim", "folke/which-key.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local which_key = require("which-key")

			which_key.register({
				f = {
					"Fuzzy finder",
					v = { builtin.treesitter, "Find entities" },
					g = { builtin.live_grep, "Live grep" },
					b = { builtin.buffers, "Buffers" },
					h = { builtin.help_tags, "Help" },
					k = { builtin.man_pages, "Man pages" },
				},
				["<leader>"] = { builtin.find_files, "Find files" },
			}, { prefix = "<leader>" })
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
