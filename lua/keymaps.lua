local opts = { noremap = true, silent = true }

-- vim.api.nvim_set_keymap("v", "<leader>y", '"*y', opts)
-- vim.api.nvim_set_keymap({ "n", "v" }, "<leader>p", "+*p", opts)

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


-- Code action
vim.keymap.set({ "v", "n" }, "<space>ca", require("actions-preview").code_actions)

-- Codeium
vim.g.codeium_disable_bindings = 1
vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<C-p>",
  ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({winblend = 1}))<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>",
  ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({winblend = 1}))<CR>", opts)
