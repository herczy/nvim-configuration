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
					f = { builtin.find_files, "Find files" },
					g = { builtin.live_grep, "Live grep" },
					b = { builtin.buffers, "Buffers" },
					h = { builtin.help_tags, "Help" },
				},
			}, { prefix = "<leader>" })

			--       vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
			--       vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
			--       vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
			--       vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help with preview' })
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

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
