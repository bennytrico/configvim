local opts = { noremap = true, silent = true }

-- vim.api.nvim_set_keymap("v", "<leader>y", '"*y', opts)
-- vim.api.nvim_set_keymap({ "n", "v" }, "<leader>p", "+*p", opts)
vim.api.nvim_set_keymap("n", "<leader>hl", ":nohl<CR>", opts)


-- REST
require("telescope").load_extension("rest")
vim.api.nvim_set_keymap("n", "<space>hr", ":Rest open<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>trr", ":Telescope rest select_env<CR>", opts)

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

-- -- Codeium
-- vim.g.codeium_disable_bindings = 1
-- vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
-- vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
-- vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
-- vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })


local layoutWidthTelescope = .9

-- Telescope
vim.api.nvim_set_keymap("n", "<C-p>",
  ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({winblend = 1, layout_config = {width= " ..
  layoutWidthTelescope .. "}} ))<CR>",
  opts)
vim.api.nvim_set_keymap("n", "<C-f>",
  ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({winblend = 1, layout_config = {width= " ..
  layoutWidthTelescope .. "}}))<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>b",
  ":lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ layout_config = {width= " ..
  layoutWidthTelescope .. "},symbol_width = 100, symbols={'function', 'func', 'struct', 'interface', 'method'} }))<CR>",
  opts)
-- vim.api.nvim_set_keymap("n", "<C-l", ":lua require('telescope.builtin').lsp_document_symbols()", opts)
