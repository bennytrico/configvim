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
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'posva/vim-vue'
Plug 'othree/xml.vim'
Plug 'othree/html5.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
"Plug 'thosakwe/vim-flutter'
Plug 'natebosch/dartlang-snippets'
Plug 'junegunn/seoul256.vim'
"Plug 'vim-airline/vim-airline'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
"Plug 'NTBBloodbath/galaxyline.nvim'
Plug 'ojroques/nvim-hardline'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-test/vim-test'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" nvim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'kevinhwang91/nvim-bqf'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-lua/lsp-status.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'rafaelsq/nvim-goc.lua'
Plug 'folke/lsp-colors.nvim'

Plug 'akinsho/flutter-tools.nvim'
call plug#end()

let g:ale_fixers = {
\   'typescript': ['prettier', 'eslint'],
\   'javascript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\}

let g:ale_linters = {}
let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.javascript = ['eslint', 'tsserver']

let g:ale_typescript_prettier_use_local_config = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1

autocmd BufWritePost *.go silent exec ":GoFmt"
"autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go lua goimports(1000)
"autocmd FileType go nmap <leader><space> :GoFmt<cr>
"autocmd FileType go nmap <leader><space> :GoFmt<cr>
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_fmt_command = "gofmt"
let g:go_fmt_autosave = 1

inoremap jk <ESC>
nmap <C-n> :CHADopen<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let leader = exists('g:mapleader') ? g:mapleader : '\'

autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
autocmd FileType dart setlocal ts=2 sw=2 expandtab
autocmd FileType typescriptreact setlocal ts=2 sw=2 expandtab

" coc config
" from readme
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
map <C-f>  :Ag<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>

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

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

lua <<EOF
require('telescope').setup {
  defaults = { 
    file_ignore_patterns = {"node_modules"},
  },
} 
EOF

" mapping for vim-test for scrolling
if has('nvim')
  tmap <C-s> <C-\><C-n>
endif

lua <<EOF
vim.g.tokyonight_transparent = true

vim.cmd[[colorscheme tokyonight]]
EOF


" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

set statusline=
set statusline+=%{LspStatus()}
