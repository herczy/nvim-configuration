-- Imported from old .vimrc file
vim.cmd("set ts=2")
vim.cmd("set modelines=1")
vim.cmd("set sts=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set ai")
vim.cmd("set et")
vim.cmd("set nu")
vim.cmd("set ml")
vim.cmd("set fo=ro")
vim.cmd("set nohlsearch")
vim.cmd("set signcolumn=yes")
vim.cmd("set scrolloff=10")
vim.cmd("set mouse=")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>R", ":source ~/.config/nvim/init.lua<cr>", { desc = "Reload configuration" })
vim.keymap.set("i", "<C-Down>", "<esc>o", { desc = "Insert line below" })
vim.keymap.set("i", "<C-Up>", "<esc>O", { desc = "Insert line below" })
vim.keymap.set("n", "<leader>?", function()
	vim.diagnostic.open_float({ border = "single" })
end, { desc = "Show error details" })
