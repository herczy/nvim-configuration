return {
	"stevearc/overseer.nvim",
	config = function()
		local overseer = require("overseer")
		local which_key = require("which-key")

		vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
			callback = function()
				local cwd = vim.v.cwd or vim.fn.getcwd()
				overseer.preload_task_cache({ dir = cwd })
			end,
		})

		overseer.setup({})
		which_key.register({
			o = {
				"Overseer",
				r = {
					function()
						overseer.open({ enter = true })
						overseer.run_template()
					end,
					"Run action",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
