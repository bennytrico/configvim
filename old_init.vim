"set tabstop=4 
"set shiftwidth=4
""set expandtab
"set number
"set encoding=UTF-8
set guifont=FiraMono\ Nerd\ Font:h11
"set autoindent
"set smartindent
"set textwidth=80
set guitablabel=%t
""set colorcolumn=72
"set relativenumber
"set list listchars=tab:\|\-

call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/xml.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'alvan/vim-closetag'
Plug 'ojroques/nvim-hardline'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
"Plug 'github/copilot.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-test/vim-test'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'terrortylor/nvim-comment'

" nvim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'


" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-lua/lsp-status.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Plug 'rafaelsq/nvim-goc.lua'
Plug 'kyoh86/vim-go-coverage'
Plug 'folke/lsp-colors.nvim'

Plug 'akinsho/flutter-tools.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'onsails/lspkind-nvim'

" Plug 'rafamadriz/neon'
" Plug 'shaeinst/roshnivim-cs'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'ellisonleao/glow.nvim'
Plug 'goolord/alpha-nvim'

"TODO
Plug 'folke/todo-comments.nvim'
Plug 'onsails/diaglist.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'mfussenegger/nvim-jdtls'

" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'nvim-orgmode/orgmode'

Plug 'ThePrimeagen/harpoon'

Plug 'folke/which-key.nvim'

Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/dap-buddy.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'jbyuki/one-small-step-for-vimkind'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'xiyaowong/nvim-transparent'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()


set completeopt=menu,menuone,noselect

let leader = exists('g:mapleader') ? g:mapleader : '\'

autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
autocmd FileType dart setlocal ts=2 sw=2 expandtab
autocmd FileType typescriptreact setlocal ts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sw=2 expandtab
autocmd FileType javascriptreact setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sw=2 expandtab

" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

noremap <leader>y "*y
noremap <leader>p "*p
" map <C-f> <cmd>Telescope live_grep<cr>
" nnoremap <C-p> <cmd>Telescope find_files<cr>

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

" git
nmap <leader>gs :G<CR>
nmap <leader>gk :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>

" remove highlight
nmap <leader>h :nohl<CR>

let g:chadtree_settings = {
	\ "theme": {
		\ "text_colour_set": "solarized_light"
  \ 	}
  \ }

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
"colorscheme tender
"let g:airline_theme = 'tender'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'go', 'typescript', 'javascript', 'html', 'vue', 'dart', 'java', 'json'}, 
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" mapping for vim-test for scrolling
if has('nvim')
  tmap <C-s> <C-\><C-n>
endif

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

set statusline=
set statusline+=%{LspStatus()}

nnoremap gd gdzz
nnoremap gi gdzz
nnoremap gr gdzz

" colorscheme rvcs
colorscheme catppuccin
lua << EOF
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup()
EOF

set cursorline
highlight CursorLine gui=underline cterm=underline ctermfg=None guifg=None
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

nnoremap + <C-a>
nnoremap - <C-x>
set lazyredraw
nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>

let g:transparent_enabled = v:true
