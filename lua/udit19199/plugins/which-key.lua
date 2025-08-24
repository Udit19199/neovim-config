return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    -- New which-key spec format
    wk.add({
      -- Basic
      { "<leader>w", "<cmd>w<CR>", desc = "Save file" },
      { "<leader>W", "<cmd>wa<CR>", desc = "Save all files" },
      { "<leader>q", "<cmd>bd<CR>", desc = "Close buffer" },
      { "<leader>Q", "<cmd>qa<CR>", desc = "Quit all" },

      -- Window Navigation
      { "<C-h>", "<C-w>h", desc = "Go to left window" },
      { "<C-j>", "<C-w>j", desc = "Go to lower window" },
      { "<C-k>", "<C-w>k", desc = "Go to upper window" },
      { "<C-l>", "<C-w>l", desc = "Go to right window" },

      -- Editing
      { "<leader>a", "ggVG", desc = "Select all" },
      { "<leader>z", "u", desc = "Undo" },

      -- Search and Replace
      { "<leader>sr", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], desc = "Search and replace word under cursor" },

      -- Code Actions group
      { "<leader>c", group = "Code Actions" },
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code actions" },
      { "<leader>cf", function() vim.lsp.buf.format() end, desc = "Format file" },
      { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename symbol" },

      -- Diagnostics group
      { "<leader>d", group = "Diagnostics" },
      { "<leader>de", function() vim.diagnostic.open_float() end, desc = "Show diagnostic" },
      { "<leader>dl", function() vim.diagnostic.setloclist() end, desc = "Diagnostic list" },
      { "<leader>dp", function() vim.diagnostic.jump_prev() end, desc = "Previous diagnostic" },
      { "<leader>dn", function() vim.diagnostic.jump_next() end, desc = "Next diagnostic" },

      -- Find group (Telescope)
      { "<leader>f", group = "Find" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Commands" },

      -- Project group
      { "<leader>p", group = "Project" },
      { "<leader>ps", "<cmd>Telescope npm scripts<CR>", desc = "NPM scripts" },

      -- Git group
      { "<leader>g", group = "Git" },
      { "<leader>gg", "<cmd>Telescope git_status<CR>", desc = "Git status" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },

      -- Splits group
      { "<leader>s", group = "Splits" },
      { "<leader>sv", "<cmd>vsplit<CR>", desc = "Vertical split" },
      { "<leader>sh", "<cmd>split<CR>", desc = "Horizontal split" },

      -- Terminal
      { "<leader>t", "<cmd>terminal<CR>", desc = "Open terminal" },

      -- New group
      { "<leader>n", group = "New" },
      { "<leader>nf", "<cmd>enew<CR>", desc = "New file" },

      -- Copy group
      { "<leader>y", group = "Copy" },
      { "<leader>yp", "<cmd>let @+ = expand('%:p')<CR>", desc = "Copy file path" },
    })

    -- Other non-leader keymaps (these don't go in the which-key table)
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
    vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
    vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
    vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
  end,
}
