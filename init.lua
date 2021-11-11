vim.cmd('source ~/.config/nvim/old_init.vim')




require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
require('nvim-autopairs').setup{}

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
