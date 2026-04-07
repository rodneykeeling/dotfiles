require('nvim-treesitter').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
require('nvim-treesitter').install({
  'bash',
  'dockerfile',
  'graphql',
  'javascript',
  'json',
  'lua',
  'python',
  'query',
  'typescript',
  'yaml',
})
