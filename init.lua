vim.cmd('source ~/.config/nvim/old_init.vim')

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
require('nvim-autopairs').setup{}

require('dashboard-config')
require('go')
require('option')
require('lsp')
require('hardline').setup {}
require('own_flutter')
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
require('indent_blank_line_own')

vim.cmd [[
  autocmd BufWritePost *.go silent exec ":GoFmt"
  autocmd BufWritePre *.go silent exec ":GoImports"
]]

  -- autocmd BufWritePre *.go lua goimports(1000)
require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}


require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require'nvim-web-devicons'.get_icons()
require("nvim_comment").setup({
	hook = function()
		require('ts_context_commentstring.internal').update_commentstring()
	end
})

local g = vim.g
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
g.nvim_tree_add_trailing = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_show_icons = {
   git = 1,
   folders = 1,
   folder_arrows = 1,
   files = 1,
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    -- ignore_ft_on_setup = { "dashboard" },
    quit_on_open = true,
    hide_dotfiles = 1,
    follow = 1,
    git_hl = 1,
    auto_close = false,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
	diagnostics = {
		enable = false,
		icons = {
		  hint = "",
		  info = "",
		  warning = "",
		  error = "",
		}
	  },
    view = {
        width = 35,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                { key = "s", cb = tree_cb("vsplit") },
                { key = "S", cb = tree_cb("split") },
            }
        }
    }
}
