lua <<EOF
require('plugins')
require('bufferline').setup()
require('nvim-tree').setup({
actions = {
    open_file = {
        quit_on_open = true
        }
    }
})
require('gitsigns').setup()
require('Comment') -- when need use, call setup()
require('github-theme').setup({
theme_style = "dark"
})

require("toggleterm").setup({
    direction = 'float'    
})
require("lualine").setup()
require('impatient')
require('filetype')
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF

set termguicolors
set ignorecase
set ts=4
set smarttab
set nu
set shiftwidth=4
set autoindent
set expandtab
set nofixendofline
set nowrap

nmap <C-p> <cmd>Telescope find_files<cr>
nmap ff <cmd>Telescope current_buffer_fuzzy_find<cr>
nmap FF <cmd>Telescope live_grep<cr>

nmap tt <cmd>ToggleTerm<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

nmap <c-b> <cmd>NvimTreeToggle<cr>
nmap <tab><tab> <cmd>bNext<cr>
