-- ~/.config/nvim/lua/udit19199/mappings.lua

-- Set leader key to space
vim.g.mapleader = " "

-- Basic mappings

vim.keymap.set("n", "<leader>w", "<C-w>h", {noremap = true, silent = true})

-- Save file
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })

-- Close buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", "u", { noremap = true, silent = true })

