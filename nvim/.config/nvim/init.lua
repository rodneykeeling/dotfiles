local g = vim.g
local map = vim.api.nvim_set_keymap

-- mappings
-- map leader key to Space
map('n', '<Space>', '', {})
g.mapleader = ' '

map('n', '`', '0', {})
map('n', ';', ':', { noremap = true })

map('n', 'n', 'nzz', { noremap = true })
map('n', 'N', 'Nzz', { noremap = true })

-- <leader>c to print current python class name
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<cr>', {})
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', {})
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
map('n', '<leader>gg', '<cmd>GitGutterSignsToggle<cr>', {})
map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<cr>', {})

-- <C-w> remaps
map('n', '<leader>h', '<C-w>h', {})
map('n', '<leader>j', '<C-w>j', {})
map('n', '<leader>k', '<C-w>k', {})
map('n', '<leader>l', '<C-w>l', {})

-- buffer stuff
map('n', '<leader><tab>', '<cmd>bn<cr>', {})
map('n', '<leader>b', '<cmd>BufferLinePick<cr>', {})

vim.cmd[[highlight link CompeDocumentation Pmenu]]
vim.cmd[[au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql]]

-- custom configs
require('r.plugins')
require('r.settings')
require('r.lsp')
require('r.treesitter')
require('r.completion')
require('r.telescope')
