-- Enhanced keymaps for MERN stack development
vim.g.mapleader = " "

-- ======================= FILE OPERATIONS =======================
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", { desc = "Save all files" })
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

-- ======================= NAVIGATION =======================
-- Quick window navigation (better than your current <leader>w)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- ======================= EDITING =======================
-- Keep your existing mappings but improved
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })
vim.keymap.set("n", "<leader>z", "u", { desc = "Undo" })

-- Better search and replace (enhanced version of your C-a mapping)
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Search and replace word under cursor" })
vim.keymap.set("v", "<leader>sr", [[:s/\V<C-R>=escape(@",'/\')<CR>//g<Left><Left>]], { desc = "Search and replace selection" })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ======================= CODE ACTIONS =======================
-- LSP mappings (will be used in lsp-config.lua)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file" })

-- ======================= TELESCOPE MAPPINGS =======================
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Commands" })

-- ======================= PROJECT SPECIFIC =======================
-- Package.json script runner
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope npm scripts<CR>", { desc = "NPM scripts" })

-- Git mappings
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })

-- ======================= QUICK ACTIONS =======================
-- Split windows
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>", { desc = "Open terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ======================= HACKATHON SPEED MAPPINGS =======================
-- Quick file creation
vim.keymap.set("n", "<leader>nf", "<cmd>enew<CR>", { desc = "New file" })

-- Copy file path
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Copy file path" })

-- Toggle word wrap
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

-- ======================= VISUAL MODE ENHANCEMENTS =======================
-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
