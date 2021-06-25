local g = vim.g
local map = vim.api.nvim_set_keymap

-- mappings
-- map leader key to Space
map('n', '<Space>', '', {})
g.mapleader = ' '

map('n', '`', '^', {})

-- <leader>c to print current class name
map('n', '<leader>c', ':<c-u>echo trim(getline(search("^class", "bnW")))<cr>', {})
map('n', '<leader>d', ':lua vim.lsp.buf.definition()<cr>', {})
map('n', '<leader>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', {})
map('n', '<leader>gg', ':GitGutterSignsToggle<cr>', {})

-- custom configs
require('r.settings')
require('r.plugins')
require('r.telescope')
require('r.treesitter')
