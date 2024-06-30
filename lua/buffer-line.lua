vim.opt.termguicolors = true
require("bufferline").setup{}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "ç", ":bd<CR>", opts)
