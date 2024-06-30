" set clipboard=unnamedplus

set completeopt=menu,menuone,noselect

let leader = exists('g:mapleader') ? g:mapleader : '\'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" noremap <leader>y "*y
" noremap <leader>p "*p

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

nnoremap + <C-a>
nnoremap - <C-x>
set lazyredraw

nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>

let g:transparent_enabled = v:true
