-- Set space as the leader key
vim.g.mapleader = " "

-- Map <leader>pv to toggle nvim-tree instead of netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
