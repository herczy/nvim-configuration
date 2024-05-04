return {
	"NTBBloodbath/zig-tools.nvim",
	-- Load zig-tools.nvim only in Zig buffers
	config = function()
		-- Initialize with default config
		require("zig-tools").setup()
		require("toggleterm").setup()
	end,
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-lua/plenary.nvim",
	},
}
