-- Set space as the leader key
vim.g.mapleader = " "

-- Map <leader>pv to toggle nvim-tree instead of netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move whole line up and down on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
