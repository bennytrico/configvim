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
Plug 'posva/vim-vue'
Plug 'othree/xml.vim'
Plug 'othree/html5.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'alvan/vim-closetag'
Plug 'ojroques/nvim-hardline'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

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
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

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
call plug#end()


let g:ale_fixers = {
\   'typescript': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'javascriptreact': ['eslint', 'prettier'],
\   'vue': ['prettier', 'eslint'],
\}

 "let g:ale_linters = {
 "\'go': ['gopls'],
 "\}
let g:ale_linters = {}
let g:ale_linters.typescript = ['eslint', 'prettier']
let g:ale_linters.javascript = ['eslint', 'prettier']

let g:ale_typescript_prettier_use_local_config = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1

"let g:go_fmt_command = "gofmt"
let g:go_fmt_autosave = 1

let leader = exists('g:mapleader') ? g:mapleader : '\'

autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
autocmd FileType dart setlocal ts=2 sw=2 expandtab
autocmd FileType typescriptreact setlocal ts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sw=2 expandtab
autocmd FileType javascriptreact setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab

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
map <C-f> <cmd>Telescope live_grep<cr>
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

let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"Ikf 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

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
