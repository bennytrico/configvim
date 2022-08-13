require("telescope").load_extension("flutter")

vim.api.nvim_set_keymap('n', '<space>tff', ':lua require("telescope").extensions.flutter.commands()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>frs', ':FlutterRun --flavor staging --no-sound-null-safety<CR>', {silent=true})
