local which_key = require("which-key")

which_key.add({
	{ "<leader>gj", [[ <cmd>cn<cr> ]], desc = "Next error" },
	{ "<leader>gk", [[ <cmd>cp<cr> ]], desc = "Previous error" },
	{ "<leader>BD", [[ <cmd>%bd|e#<cr> ]], desc = "Delete all buffers but current" },
})
