lua <<EOF

require('plugins')
require('bufferline').setup()
require('nvim-tree').setup()
require('gitsigns').setup()
require('Comment') -- when need use, call setup()
require('github-theme').setup({
    theme_style = "dark"
})

EOF

set termguicolors
set ignorecase
set ts=4
set smarttab
set nu
set shiftwidth=4
set autoindent
set expandtab
