require("flutter-tools").setup{
  widget_guides = {
    enabled = true,
  },
}
require("telescope").load_extension("flutter")

vim.api.nvim_set_keymap('n', '<space>tff', ':lua require("telescope").extensions.flutter.commands()<CR>', {silent=true})
