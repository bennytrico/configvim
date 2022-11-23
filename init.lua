vim.cmd('source ~/.config/nvim/old_init.vim')

 require("which-key").setup {
}

require('orgmode').setup_ts_grammar()

require('telescope').setup {
	defaults = { 
	  file_ignore_patterns = {"node_modules"},
	},
}
require('telescope').load_extension('dap')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
  autotag = {
	  enable = true
  }
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

require('nvim-autopairs').setup{}

require('dashboard-config')
require('go')
require('option')
require('lsp')
require('own-dap.init').setup()
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
  " autocmd BufWritePost *.go silent exec ":GoFmt"
  " autocmd BufWritePost *.go lua vim.lsp.buf.formatting()
  " autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
  " autocmd BufWritePre *.go lua goimports(1000)
  autocmd BufWritePre *.go :silent! lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.go :silent! lua goimports(3000)
  " autocmd BufWritePre *.go lua goimports(1000)
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.json lua vim.lsp.buf.formatting()
  " autocmd BufWritePre *.json :silent exec ":%!jq ."
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
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

local root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    -- ignore_ft_on_setup = { "dashboard" },
    -- follow = 1,
  	create_in_closed_folder = false,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
  	respect_buf_cwd = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = false,
        ignore_list = {}
    },
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
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
	renderer = {
		root_folder_modifier = root_folder_modifier,
    	add_trailing = true,
		group_empty = true,
		indent_markers = {
			enable = true,
			  icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			  },
		},
		icons = {
		  symlink_arrow = " ➛ ",

		  glyphs = {
     default = '',
     symlink = '',
     git = {
       unstaged = "✗",
       staged = "✓",
       unmerged = "",
       renamed = "➜",
       untracked = "★",
       deleted = "",
       ignored = "◌"
       },
     folder=  {
       arrow_open = "",
       arrow_closed = "",
       default = "",
       open = "",
       empty = "",
       empty_open = "",
       symlink = "",
       symlink_open = "",
       }
		  }
		},
	    highlight_opened_files = "*",
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
	},
    view = {
        width = 35,
        side = 'left',
    	preserve_window_proportions = true,
        mappings = {
            custom_only = false,
            list = {
                { key = "s", cb = tree_cb("vsplit") },
                { key = "S", cb = tree_cb("split") },
            }
        }
    },
	actions = {
		use_system_clipboard = true,
		change_dir = {
		  enable = true,
		  global = false,
		  restrict_above_cwd = false,
		},
		open_file = {
		  quit_on_open = true,
		  resize_window = false,
		  window_picker = {
			enable = true,
			chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
			exclude = {
			  filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
			  buftype = { "nofile", "terminal", "help" },
			},
		  },
		},
	  },
}

if vim.fn.has('nvim-0.5.1') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
    end

    vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end

local border_chars = {
	TOP_LEFT = '┌',
	TOP_RIGHT = '┐',
	MID_HORIZONTAL = '─',
	MID_VERTICAL = '│',
	BOTTOM_LEFT = '└',
	BOTTOM_RIGHT = '┘',
}

vim.g.lsp_utils_location_opts = {
	height = 24,
	mode = 'editor',
	preview = {
		title = 'Location Preview',
		border = true,
		border_chars = border_chars
	},
	keymaps = {
		n = {
			['<C-n>'] = 'j',
			['<C-p>'] = 'k',
		}
	}
}


vim.g.lsp_utils_symbols_opts = {
	height = 24,
	mode = 'editor',
	list = {
		border = true,
		border_chars = border_chars
	},
	preview = {
		title = 'Symbols Preview',
		border = true,
		border_chars = border_chars
	},
	prompt = {},
}

-- harpoon
vim.api.nvim_set_keymap('n', '<space>ha', ':lua require("harpoon.mark").add_file()<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<space>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap=true,silent=true})

require'colorizer'.setup()

require("coverage").setup({
	commands = true, -- create commands
	highlights = {
		-- customize highlight groups created by the plugin
		covered = { fg = "#C3E88D" },   -- supports style, fg, bg, sp (see :h highlight-gui)
		uncovered = { fg = "#F07178" },
	},
	signs = {
		-- use your own highlight groups or text markers
		covered = { hl = "CoverageCovered", text = "▎" },
		uncovered = { hl = "CoverageUncovered", text = "▎" },
	},
	summary = {
		-- customize the summary pop-up
		min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
	},
})
