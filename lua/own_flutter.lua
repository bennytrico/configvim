require("flutter-tools").setup{
  widget_guides = {
    enabled = false,
  },
  fvm = true,
  dev_log = {
    enabled = true,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
}
require("telescope").load_extension("flutter")

vim.api.nvim_set_keymap('n', '<space>tff', ':lua require("telescope").extensions.flutter.commands()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>frs', ':FlutterRun --flavor staging --no-sound-null-safety<CR>', {silent=true})
