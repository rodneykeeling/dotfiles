-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'vsnip', keyword_length = 3 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end
    },
})
