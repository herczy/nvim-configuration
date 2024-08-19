return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")
		local which_key = require("which-key")

		gs.setup({
      signs = {
				add = { text = "+" },
				change = { text = "»" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "±" },
				untracked = { text = "?" },
      },
      signs_staged = {
				add = { text = "S+" },
				change = { text = "S»" },
				delete = { text = "S-" },
				topdelete = { text = "S‾" },
				changedelete = { text = "S±" },
				untracked = { text = "S?" },
      },
			numhl = true,
		})

		which_key.add({
			{ "<leader>g", desc = "Git commands" },
			{ "<leader>g0", gs.detach, desc = "Disable git for buffer" },
			{ "<leader>g1", gs.attach, desc = "Enable git for buffer" },
			{ "<leader>gD", gs.diffthis, desc = "Git diff for buffer" },
			{ "<leader>gs", gs.stage_hunk, desc = "Stage current hunk" },
			{ "<leader>gu", gs.undo_stage_hunk, desc = "Unstage current hunk" },
			{ "<leader>gd", gs.toggle_deleted, desc = "Show deleted lines" },
			{ "<leader>gw", gs.toggle_word_diff, desc = "Show word diff" },
			{ "gj", gs.next_hunk, desc = "Go to next hunk" },
			{ "gk", gs.prev_hunk, desc = "Go to previous hunk" },
		})
	end,
}
