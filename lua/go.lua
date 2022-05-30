-- if set, when we switch between buffers, it will not split more than once. It will switch to the existing buffer instead
-- vim.opt.switchbuf = 'useopen'
-- 
-- local goc = require'nvim-goc'
-- goc.setup({ verticalSplit = false })

vim.api.nvim_set_keymap('n', '<space>tn', ':TestNearest<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>gcr', ':GoCover<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>gcc', ':GoCoverClearAll<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<Leader>gcr', ':lua require("nvim-goc").Coverage()<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<Leader>gcc', ':lua require("nvim-goc").ClearCoverage()<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<Leader>gct', ':lua require("nvim-goc").CoverageFunc()<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<Leader>gca', ':lua cf(false)<CR><CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<Leader>gcb', ':lua cf(true)<CR><CR>', {silent=true})
