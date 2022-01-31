local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- mappings
-- map leader key to Space
map("n", "<Space>", "", opts)
g.mapleader = " "

map("n", "`", "0", opts)
map("n", ";", ":", opts)

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

map("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
map("n", "<leader>gg", "<cmd>GitGutterSignsToggle<cr>", opts)
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
map("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", opts)

-- <C-w> remaps
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

-- buffer stuff
map("n", "<leader><tab>", "<cmd>bn<cr>", opts)
map("n", "<leader><s-tab>", "<cmd>bp<cr>", opts)
map("n", "<leader>b", "<cmd>BufferLinePick<cr>", opts)

-- snippets jumping
vim.cmd[[ imap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>" ]]
vim.cmd[[ smap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>" ]]

vim.cmd[[ au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql ]]

-- custom configs
require("r.plugins")
require("r.settings")
require("r.lsp")
require("r.treesitter")
require("r.completion")
require("r.telescope")
