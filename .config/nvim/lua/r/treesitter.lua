require'lspconfig'.pyright.setup{}

-- LSP diagnostics show only on hover
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false, 
    }
)

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash', 'dockerfile', 'go', 'graphql', 'javascript', 'json', 'lua',
        'python', 'query', 'typescript', 'yaml',
    },
    highlight = {
        enable = true,              -- false will disable the whole extension
        --disable = { 'python' },  -- list of language that will be disabled
    },
    indent = {
        enable = true
    },
}

