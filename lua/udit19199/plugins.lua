return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      {"<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree"}
    }
  },

}
