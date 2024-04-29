-- Done with the tutorial https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn

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
vim.keymap.set('n', '<leader>R', ':source ~/.config/nvim/init.lua<cr>', { desc = "Reload configuration" })

-- Select package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")
