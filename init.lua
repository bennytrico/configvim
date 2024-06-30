require("config.lazy")
vim.cmd('source ~/.config/nvim/old_init.vim')

require("which-key").setup {
}

require('move').setup({
  line = {
    enable = true, -- Enables line movement
    indent = true  -- Toggles indentation
  },
  block = {
    enable = true, -- Enables block movement
    indent = true  -- Toggles indentation
  },
  word = {
    enable = true, -- Enables word movement
  },
  char = {
    enable = false -- Enables char movement
  }
})

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules" },
    layout_config = {
      vertical = { width = 1 }
      -- other layout configuration here
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}
require('telescope').load_extension('dap')

require('nvim-ts-autotag').setup()

require('nvim-autopairs').setup {}

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
  autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format()
  autocmd BufWritePre *.go :silent! lua goimports(3000)
  autocmd BufWritePre *.ts lua vim.lsp.buf.format()
  autocmd BufWritePre *.astro lua vim.lsp.buf.format()
  autocmd BufWritePre *.tsx lua vim.lsp.buf.format()
  autocmd BufWritePre *.js lua vim.lsp.buf.format()
  autocmd BufWritePre *.jsx lua vim.lsp.buf.format()
  autocmd BufWritePre *.json lua vim.lsp.buf.format()
  autocmd BufWritePre *.dart lua vim.lsp.buf.format()
  autocmd BufWritePre *.sql lua vim.lsp.buf.format()
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.astro EslintFixAll

	autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
	autocmd FileType dart setlocal ts=2 sw=2 expandtab
	autocmd FileType typescriptreact setlocal ts=2 sw=2 expandtab
	autocmd FileType typescript setlocal ts=2 sw=2 expandtab
	autocmd FileType javascriptreact setlocal ts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=2 sw=2 expandtab
	autocmd FileType json setlocal ts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sw=2 expandtab
	autocmd FileType lua setlocal ts=2 sw=2 expandtab
]]

-- autocmd BufWritePre *.go lua goimports(1000)
require("todo-comments").setup {}

require 'nvim-web-devicons'.setup {
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
  },
  default = true,
}
require 'nvim-web-devicons'.get_icons()
require("nvim_comment").setup({
  hook = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end
})

local root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

if vim.fn.has('nvim-0.5.1') == 1 then
  vim.lsp.handlers['textDocument/codeAction'] = require 'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['textDocument/references'] = require 'lsputil.locations'.references_handler
  vim.lsp.handlers['textDocument/definition'] = require 'lsputil.locations'.definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require 'lsputil.locations'.declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require 'lsputil.locations'.typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require 'lsputil.locations'.implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require 'lsputil.symbols'.document_handler
  vim.lsp.handlers['workspace/symbol'] = require 'lsputil.symbols'.workspace_handler
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

--REST
vim.api.nvim_set_keymap('n', '<space>r', '<Plug>RestNvim,', { noremap = true, silent = true })

require 'colorizer'.setup()

require("coverage").setup({
  commands = true, -- create commands
  highlights = {
    -- customize highlight groups created by the plugin
    covered = { fg = "#C3E88D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
    uncovered = { fg = "#F07178" },
  },
  signs = {
    -- use your own highlight groups or text markers
    covered = { hl = "CoverageCovered", text = "▎" },
    uncovered = { hl = "CoverageUncovered", text = "▎" },
  },
  summary = {
    -- customize the summary pop-up
    min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
  },
})

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'S', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

require 'treesitter-context'.setup {
  enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20,     -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

local Error = "#db4b4b"
local Warning = "#e0af68"
local Information = "#0db9d7"
local Hint = "#10B981"
local Search = "#FAFAFA"
local Misc = "#A8A8A8"

require('git-conflict').setup()
require("scrollbar").setup({
  handle = {
    color = Information,
  },
  marks = {
    Search = { color = Search },
    Error = { color = Error },
    Warn = { color = Warning },
    Info = { color = Information },
    Hint = { color = Hint },
    Misc = { color = Misc },
    GitAdd = {
      text = "+",
      priority = 7,
      gui = nil,
      color = Hint,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "GitSignsAdd",
    },
    GitChange = {
      text = "~",
      priority = 7,
      gui = nil,
      color = Warning,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "GitSignsChange",
    },
    GitDelete = {
      text = "-",
      priority = 7,
      gui = nil,
      color = Error,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "GitSignsDelete",
    },
  }
})
require("gitsigns").setup()
require("scrollbar.handlers.gitsigns").setup()

require("actions-preview").setup {
  telescope = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.8,
      height = 0.9,
      prompt_position = "top",
      preview_cutoff = 40,
      preview_height = function(_, _, max_lines)
        return max_lines - 30
      end,
    },
  },
}

require('buffer-line')
require('keymaps')
