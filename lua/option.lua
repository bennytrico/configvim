vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.encoding = 'UTF-8'
--vim.opt.guifont = 'FiraMono\ Nerd\ Font:h11'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.textwidth = 80
--vim.opt.guitablabel = '%t'
vim.opt.relativenumber = true

-- Dart
vim.g.dart_style_guide = 2
vim.g.dart_format_on_save = 1

-- Markdown
vim.g.glow_binary_path = vim.env.HOME .. "/bin"

-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--   vim.g.copilot_filetypes = {
--     ["*"] = false,
--     ["javascript"] = true,
--     ["typescript"] = true,
--     ["javascriptreact"] = true,
--     ["typescriptreact"] = true,
--     ["lua"] = false,
--     ["rust"] = true,
--     ["c"] = true,
--     ["c#"] = true,
--     ["c++"] = true,
--     ["go"] = true,
--     ["python"] = true,
-- 	["dart"] = true,
--   }
