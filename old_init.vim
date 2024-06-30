"set tabstop=4 
"set shiftwidth=4
""set expandtab
"set number
"set encoding=UTF-8
" set guifont=FiraMono\ Nerd\ Font:h11
"set autoindent
" set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h11
"set smartindent
"set textwidth=80
" set guitablabel=%t
" set colorcolumn=100
"set relativenumber
"set list listchars=tab:\|\-

call plug#begin('~/.vim/plugged')
" Plug 'mattn/emmet-vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'airblade/vim-gitgutter'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'othree/xml.vim'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'w0rp/ale'
" Plug 'tpope/vim-fugitive'
" Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
" Plug 'alvan/vim-closetag'
" Plug 'ojroques/nvim-hardline'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" Plug 'github/copilot.vim'

" Plug 'nvim-neotest/nvim-nio'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'vim-test/vim-test'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-context'

" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Plug 'terrortylor/nvim-comment'

" nvim lsp
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'


" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'L3MON4D3/LuaSnip'

" Plug 'nvim-lua/lsp-status.nvim'
" Plug 'windwp/nvim-autopairs'
" Plug 'windwp/nvim-ts-autotag'

" Plug 'rafaelsq/nvim-goc.lua'
" Plug 'kyoh86/vim-go-coverage'
" Plug 'folke/lsp-colors.nvim'

" Plug 'akinsho/flutter-tools.nvim'
" Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v2.20.8'}
" Plug 'onsails/lspkind-nvim'

" Color
" Plug 'rafamadriz/neon'
" Plug 'tomasiser/vim-code-dark'
" Plug 'shaeinst/roshnivim-cs'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Plug 'ellisonleao/glow.nvim'
" Plug 'goolord/alpha-nvim'

"TODO
" Plug 'folke/todo-comments.nvim'
" Plug 'onsails/diaglist.nvim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'
" Plug 'mfussenegger/nvim-jdtls'

" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" Plug 'nvim-orgmode/orgmode'

" Plug 'folke/which-key.nvim'

" Plug 'mfussenegger/nvim-dap'
" Plug 'Pocco81/dap-buddy.nvim'
" Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'rcarriga/nvim-dap-ui'
" Plug 'mfussenegger/nvim-dap-python'
" Plug 'nvim-telescope/telescope-dap.nvim'
" Plug 'jbyuki/one-small-step-for-vimkind'
" 
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'xiyaowong/nvim-transparent'

" later
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Plug 'andythigpen/nvim-coverage'

" Plug 'rest-nvim/rest.nvim'

" Plug 'karb94/neoscroll.nvim'

" Plug 'fedepujol/move.nvim'
" 
" Plug 'Exafunction/codeium.vim'
" 
" Plug 'akinsho/git-conflict.nvim'
" 
" Plug 'lewis6991/gitsigns.nvim'
" " Plug 'romgrk/barbar.nvim'
" Plug 'petertriho/nvim-scrollbar'
" 
" Plug 'aznhe21/actions-preview.nvim'
" 
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
call plug#end()

set completeopt=menu,menuone,noselect

let leader = exists('g:mapleader') ? g:mapleader : '\'

" if hidden is not set, TextEdit might fail.
" set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" don't give |ins-completion-menu| messages.
" set shortmess+=c

" always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

noremap <leader>y "*y
noremap <leader>p "*p

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({winblend = 1}))<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({winblend = 1}))<cr>

" git
nmap <leader>gs :G<CR>
nmap <leader>gk :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>

" remove highlight
nmap <leader>h :nohl<CR>

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable

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
" colorscheme catppuccin
colorscheme codedark
" colorscheme abscs

set cursorline
highlight CursorLine gui=underline cterm=underline ctermfg=None guifg=None
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.

" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

nnoremap + <C-a>
nnoremap - <C-x>
set lazyredraw

nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>

let g:transparent_enabled = v:true
