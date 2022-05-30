vim.opt.list = true

vim.opt.termguicolors = true

require("indent_blankline").setup {
	char = "▏",
	buftype_exclude = {"terminal"},
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context_start = true,
}
