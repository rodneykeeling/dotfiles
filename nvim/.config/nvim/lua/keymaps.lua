-- map leader key to Space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '`', '^', { desc = 'Go to beginning of line' })

vim.keymap.set('n', 'n', 'nzz', { desc = 'Center screen on next search result' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Center screen on prev search result' })

-- Treesitter
vim.keymap.set('x', '+', 'an', { remap = true, desc = 'Increment selection (outer node)' })
vim.keymap.set('x', '_', 'in', { remap = true, desc = 'Decrement selection (inner node)' })

vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'LSP goto definition' })
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'LSP diagnostic' })
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'LSP code action' })

vim.keymap.set(
  'n',
  '<leader>=',
  function()
    require('conform').format({
      async = true,
      lsp_fallback = true,
      timeout_ms = 500,
    })
  end
)

-- <C-w> remaps
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- buffer stuff
vim.keymap.set('n', '<leader><tab>', '<cmd>bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader><s-tab>', '<cmd>bp<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>bd<cr>', { desc = 'Close buffer' })
