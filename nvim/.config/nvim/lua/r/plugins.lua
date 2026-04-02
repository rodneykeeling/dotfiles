require('lazy').setup({
  -- themes/colors
  { 'norcalli/nvim-colorizer.lua' },
  { 'catppuccin/nvim' },

  -- tooling;
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
  },
  -- {
  --     "folke/which-key.nvim",
  --     event = "VeryLazy",
  --     opts = {
  --         -- your configuration comes here
  --         -- or leave it empty to use the default settings
  --         -- refer to the configuration section below
  --     },
  --     keys = {
  --         {
  --             "<leader>?",
  --             function()
  --                 require("which-key").show({ global = false })
  --             end,
  --             desc = "Buffer Local Keymaps (which-key)",
  --         },
  --     },
  -- },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  },
  { 'kyazdani42/nvim-web-devicons' },
  { 'mhinz/vim-startify' },
  { 'neovim/nvim-lspconfig' },
  { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate', branch = 'main' },
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
  { 'MunifTanjim/nui.nvim' },
  { 'rcarriga/nvim-notify' },
  {
    'folke/noice.nvim',
    event = 'BufReadPost',
    config = function()
      require('noice').setup({
        cmdline = {
          format = {
            search_up = { icon = ' ' },
            search_down = { icon = ' ' },
          },
        },
        messages = {
          enabled = false,
        },
        notify = {
          enabled = false,
        },
        lsp = {
          progress = { enabled = false },
        },
      })
    end,
  },
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
  { 'nvim-lualine/lualine.nvim' },
  { 'SmiteshP/nvim-navic' },
  { 'windwp/nvim-autopairs' },
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
  },
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/vim-vsnip-integ' },
  { 'rafamadriz/friendly-snippets' },

  -- telescope + deps
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', branch = 'main' },
  { 'nvim-telescope/telescope.nvim' },
})
