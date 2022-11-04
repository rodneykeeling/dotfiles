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
map("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", opts)
map("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", opts)

map("n", "<leader>ld", "<cmd>Lspsaga lsp_finder<cr>", opts)

-- <C-w> remaps
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

-- buffer stuff
map("n", "<leader><tab>", "<cmd>bn<cr>", opts)
map("n", "<leader><s-tab>", "<cmd>bp<cr>", opts)
map("n", "<leader>bd", "<cmd>bd<cr>", opts)

-- snippets jumping
vim.cmd[[ xmap        <C-l>   <Plug>(vsnip-cut-text) ]]
vim.cmd[[ nmap        <C-l>   <Plug>(vsnip-cut-text) ]]
vim.cmd[[ imap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>" ]]
vim.cmd[[ smap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>" ]]

vim.cmd[[ au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql ]]
vim.cmd[[ au FileType graphql setlocal shiftwidth=2 tabstop=2 ]]
vim.cmd[[ au! BufAdd,BufRead,BufNew,BufEnter *.json let g:indentLine_conceallevel=0 ]]

-- custom configs
require("r.plugins")
require("r.settings")
require("r.lsp")
require("r.treesitter")
require("r.completion")
require("r.telescope")
