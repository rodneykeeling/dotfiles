local opts = { noremap = true, silent = true }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- mappings
-- map leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "`", "^", opts)
vim.keymap.set("n", ";", ":", opts)

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

vim.keymap.set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
vim.keymap.set("n", "<leader>=", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
        timeout_ms = 500,
    })
end, opts)

-- <C-w> remaps
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)

-- buffer stuff
vim.keymap.set("n", "<leader><tab>", "<cmd>bn<cr>", opts)
vim.keymap.set("n", "<leader><s-tab>", "<cmd>bp<cr>", opts)
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", opts)

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

-- obsidian note pop-up
vim.keymap.set("n", "<leader>o", "<cmd>belowright 20 split<cr><cmd>ObsidianNew<cr><cr>i", opts)

-- snippets jumping
vim.cmd [[ xmap        <C-l>   <Plug>(vsnip-cut-text) ]]
vim.cmd [[ nmap        <C-l>   <Plug>(vsnip-cut-text) ]]
vim.cmd [[ imap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>" ]]
vim.cmd [[ smap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>" ]]

vim.cmd [[ au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql ]]
vim.cmd [[ au FileType graphql setlocal shiftwidth=2 tabstop=2 ]]
vim.cmd [[ au! BufAdd,BufRead,BufNew,BufEnter *.json let g:indentLine_conceallevel=0 ]]

-- custom configs
require("r.plugins")
require("r.settings")
require("r.lsp")
require("r.treesitter")
require("r.completion")
require("r.telescope")
