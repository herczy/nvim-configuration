return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  tag = "v0.10.0",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
      ignore_install = { "dockerfile" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
