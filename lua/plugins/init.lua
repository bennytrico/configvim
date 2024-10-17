return {
  {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "mattn/emmet-vim",
    lazy = true,
  },
  {
    "rest-nvim/rest.nvim",
  },
  {
    "ryanoasis/vim-devicons",
    lazy = false,
    config = function()
      vim.cmd([[set encoding=UTF-8]])
    end,
  },
  {
    "airblade/vim-gitgutter",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "maxmellon/vim-jsx-pretty",
    lazy = true,
    dependencies = {
      "HerringtonDarkholme/yats.vim",
    },
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "darrikonn/vim-gofmt",
  },
  {
    "darrikonn/vim-gofmt",
    lazy = true,
    build = ":GoUpdateBinaries",
  },
  {
    "ojroques/nvim-hardline"
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end


        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 'S', api.node.open.horizontal, opts('Open: Horizontal Split'))
      end
      require 'nvim-tree'.setup {
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
              folder = {
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
          highlight_opened_files = "none",
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
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "vim-test/vim-test",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
        },
        -- ensure_installed = {'org'}, -- Or run :TSUpdate org
        -- autotag = {
        -- 			  enable = true,
        -- 			  filetypes = {
        -- 				'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
        -- 				'css', 'lua', 'xml', 'php', 'markdown', 'sql',
        -- 			      },
        -- }
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'terrortylor/nvim-comment' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp', },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  -- { 'hrsh7th/cmp-vsnip' },
  { 'nvim-lua/lsp-status.nvim' },
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },
  { 'folke/lsp-colors.nvim' },
  { 'stevearc/dressing.nvim' },
  {
    'akinsho/flutter-tools.nvim',
    lazy = true,
    require = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    }
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'onsails/lspkind-nvim' },
  { 'tomasiser/vim-code-dark' },
  { 'ellisonleao/glow.nvim',               lazy = true },
  { 'goolord/alpha-nvim' },
  { 'folke/todo-comments.nvim' },
  { 'onsails/diaglist.nvim' },
  { 'RishabhRD/popfix' },
  { 'RishabhRD/nvim-lsputils' },
  { 'mfussenegger/nvim-jdtls' },
  { 'mfussenegger/nvim-dap',               lazy = true },
  { 'Pocco81/dap-buddy.nvim',              lazy = true },
  { 'theHamsta/nvim-dap-virtual-text',     lazy = true },
  { 'rcarriga/nvim-dap-ui',                lazy = true },
  { 'mfussenegger/nvim-dap-python',        lazy = true },
  { 'nvim-telescope/telescope-dap.nvim',   lazy = true },
  { 'jbyuki/one-small-step-for-vimkind' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'xiyaowong/nvim-transparent' },
  { 'andythigpen/nvim-coverage' },
  { 'fedepujol/move.nvim' },
  { 'Exafunction/codeium.vim' },
  { 'akinsho/git-conflict.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'petertriho/nvim-scrollbar' },
  { 'aznhe21/actions-preview.nvim' },
  { 'akinsho/bufferline.nvim', },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
