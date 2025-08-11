-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins from new lazy config
require("udit19199.remap")
require("lazy").setup("udit19199.plugins")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2	")
vim.cmd("set softtabstop=2 ")
vim.cmd("set shiftwidth=2")
vim.keymap.set('n', '<C-a>', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { noremap = true, silent = false })

