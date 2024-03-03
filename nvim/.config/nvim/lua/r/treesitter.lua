require "nvim-treesitter.configs".setup {
    --ensure_installed = {
    --    "bash", "dockerfile", "go", "graphql", "javascript", "json", "lua",
    --    "python", "query", "typescript", "yaml",
    --},
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    },
}
