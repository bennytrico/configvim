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

require('nvim-treesitter.configs').setup {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  -- ensure_installed = {'org'}, -- Or run :TSUpdate org
  autotag = {
	  enable = true,
	  filetypes = {
	        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
	        'css', 'lua', 'xml', 'php', 'markdown', 'sql',
	      },
  }
}

require('nvim-ts-autotag').setup()

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
  autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format()
  autocmd BufWritePre *.go :silent! lua goimports(3000)
  " autocmd BufWritePre *.go lua goimports(1000)
  autocmd BufWritePre *.ts lua vim.lsp.buf.format()
  autocmd BufWritePre *.astro lua vim.lsp.buf.format()
  autocmd BufWritePre *.tsx lua vim.lsp.buf.format()
  autocmd BufWritePre *.js lua vim.lsp.buf.format()
  autocmd BufWritePre *.jsx lua vim.lsp.buf.format()
  autocmd BufWritePre *.json lua vim.lsp.buf.format()
  " autocmd BufWritePre *.json :silent exec ":%!jq ."
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.astro EslintFixAll
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

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 's', api.node.open.vertical,opts('Open: Vertical Split'))
  vim.keymap.set('n', 'S', api.node.open.horizontal,opts('Open: Horizontal Split'))
end

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
	on_attach = on_attach,
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
--
--REST
vim.api.nvim_set_keymap('n', '<space>r', '<Plug>RestNvim,', {noremap=true,silent=true})

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

require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to nil if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })

require('neoscroll').setup({
	mappings = {'<C-u>', '<C-d>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
})


local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "∆", ":MoveLine(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "˚", ":MoveLine(-1)<CR>", opts)
vim.api.nvim_set_keymap("v", "∆", ":MoveBlock(1)<CR>", opts)
vim.api.nvim_set_keymap("v", "˚", ":MoveBlock(-1)<CR>", opts)
vim.api.nvim_set_keymap("n", "¬", ":MoveHChar(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "˙", ":MoveHChar(-1)<CR>", opts)
vim.api.nvim_set_keymap("v", "¬", ":MoveHBlock(1)<CR>", opts)
vim.api.nvim_set_keymap("v", "˙", ":MoveHBlock(-1)<CR>", opts)

vim.g.codeium_disable_bindings = 1
vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require('git-conflict').setup()
