return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Basic setup
    require("neo-tree").setup({
      close_if_last_window = true, -- auto close if it's the last window
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- show dotfiles by default
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true }, -- auto-focus file
      },
      window = {
        width = 50,
      },
    })

    -- Keymap: toggle file explorer
    vim.keymap.set("n", "<C-n>", function()
      require("neo-tree.command").execute({ toggle = true, source = "filesystem", position = "left" })
    end, { desc = "Toggle Neo-tree" })
  end,
}

