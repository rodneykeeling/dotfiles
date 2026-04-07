-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'catppuccin/nvim' },
  {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  },
  { 'mhinz/vim-startify' },
  { 'neovim/nvim-lspconfig' },
  { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate', branch = 'main', lazy = false },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require('ibl').setup({
        scope = {
          enabled = false,
        },
      })
    end,
  },
  {
    'aserowy/tmux.nvim',
    config = function() require('tmux').setup() end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      formatters = {
        stylua = {
          append_args = function(self, context)
            if require('conform.formatters.stylua').cwd(self, context) then return {} end

            return {
              '--indent-type',
              'Spaces',
              '--indent-width',
              '2',
              '--quote-style',
              'AutoPreferSingle',
              '--collapse-simple-statement',
              'Always',
            }
          end,
        },
      },
      formatters_by_ft = {
        ['*'] = { 'trim_whitespace' },
        lua = { 'stylua' },
        python = { 'ruff_fix', 'ruff_format' },
        javascript = { 'prettier' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        typescriptreact = { 'prettier' },
        typescript = { 'prettier' },
      },
      format_after_save = {
        async = true,
        lsp_fallback = true,
        timeout_ms = 2500,
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 2500,
        lsp_format = 'fallback',
      },
    },
  },
  { 'ruanyl/vim-gh-line' },
  {
    'tanvirtin/vgit.nvim',
    lazy = false,
    keys = {
      { '<leader>gn', '<cmd>VGit hunk_down<cr>' },
      { '<leader>gp', '<cmd>VGit hunk_up<cr>' },
    },
    config = function()
      require('vgit').setup({
        settings = {
          live_blame = {
            enabled = false,
          },
          authorship_code_lens = {
            enabled = false,
          },
        },
      })
    end,
  },
  {
    'FabijanZulj/blame.nvim',
    config = function() require('blame').setup() end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = {
            normal = { c = { bg = '#24273A' } },
            inactive = { c = { bg = '#24273A' } },
          },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {},
        inactive_sections = {},
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { 'filetype', icon_only = true, separator = false, padding = 0 },
            {
              'filename',
              path = 1,
              symbols = { modified = '●', unnamed = '', readonly = '' },
              color = { fg = '#da8548' },
              padding = 1,
            },
          },
          lualine_x = {
            {
              'buffers',
              show_filename_only = true,
              symbols = {
                alternate_file = '',
                unnamed = '',
              },
              buffers_color = {
                active = { bg = '#24273A' },
                inactive = { fg = '#555555', bg = '#24273A' },
              },
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
  { 'SmiteshP/nvim-navic' },
  { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end },

  -- completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },

  -- telescope + deps
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', branch = 'main' },
  { 'nvim-telescope/telescope.nvim' },
})
