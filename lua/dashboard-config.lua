require('alpha').setup(require'alpha.themes.startify'.opts)

-- Dashboard
vim.api.nvim_set_keymap('n', '<space>al', ':Alpha<CR>', {silent=true})
