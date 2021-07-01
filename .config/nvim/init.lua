local g = vim.g
local map = vim.api.nvim_set_keymap

-- mappings
-- map leader key to Space
map('n', '<Space>', '', {})
g.mapleader = ' '

map('n', '`', '^', {})

-- <leader>c to print current python class name
map('n', '<leader>c', '<cmd><c-u>echo trim(getline(search("^class", "bnW")))<cr>', {})
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', {})
map('n', '<leader>gg', '<cmd>GitGutterSignsToggle<cr>', {})

-- <C-w> remaps
map('n', '<leader>h', '<C-w>h', {})
map('n', '<leader>j', '<C-w>j', {})
map('n', '<leader>k', '<C-w>k', {})
map('n', '<leader>l', '<C-w>l', {})

vim.cmd[[highlight link CompeDocumentation Pmenu]]

-- custom configs
require('r.plugins')
require('r.settings')
require('r.treesitter')
require('r.completion')
require('r.telescope')
