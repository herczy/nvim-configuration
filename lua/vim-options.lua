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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>R", ":source ~/.config/nvim/init.lua<cr>", { desc = "Reload configuration" })
