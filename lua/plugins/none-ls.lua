return {
	"nvimtools/none-ls.nvim",
	config = function()
		local nl = require("null-ls")

		nl.setup({
			sources = {
				nl.builtins.formatting.stylua,
        nl.builtins.formatting.black,
        nl.builtins.formatting.isort,
        nl.builtins.diagnostics.mypy,
			},
		})
	end,
}
