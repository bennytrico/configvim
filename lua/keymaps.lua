local opts = { noremap = true, silent = true }

-- Move
vim.api.nvim_set_keymap("n", "∆", ":MoveLine(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "˚", ":MoveLine(-1)<CR>", opts)
vim.api.nvim_set_keymap("v", "∆", ":MoveBlock(1)<CR>", opts)
vim.api.nvim_set_keymap("v", "˚", ":MoveBlock(-1)<CR>", opts)
vim.api.nvim_set_keymap("n", "¬", ":MoveHChar(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "˙", ":MoveHChar(-1)<CR>", opts)
vim.api.nvim_set_keymap("v", "¬", ":MoveHBlock(1)<CR>", opts)
vim.api.nvim_set_keymap("v", "˙", ":MoveHBlock(-1)<CR>", opts)

-- NvimTree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)
