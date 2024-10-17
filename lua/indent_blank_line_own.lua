vim.opt.list = false

vim.opt.termguicolors = true

require("ibl").setup {
  indent = {
    char = "▏",
  }
  -- buftype_exclude = {"terminal"},
  -- show_end_of_line = true,
  -- space_char_blankline = " ",
  -- show_current_context_start = true,
}
