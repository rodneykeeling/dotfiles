require("lazy").setup({
    -- themes/colors
    { "norcalli/nvim-colorizer.lua" },
    { "catppuccin/nvim" },

    -- tooling;
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "cssls", "eslint", "graphql", "html", "lua_ls", "pyright", "rust_analyzer"
                },
            })
        end
    },
    { "kyazdani42/nvim-web-devicons" },
    { "mhinz/vim-startify" },
    { "neovim/nvim-lspconfig" },
    { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hooks = require "ibl.hooks"
            hooks.register(
                hooks.type.WHITESPACE,
                hooks.builtin.hide_first_space_indent_level
            )
            require("ibl").setup({
                scope = {
                    enabled = false,
                },
            })
        end
    },
    {
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup()
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            formatters_by_ft = {
                ["*"] = { "trim_whitespace" },
                python = { "ruff_fix", "ruff_format" },
                javascript = { "prettier" },
                typescriptreact = { "prettier" },
                typescript = { "prettier" },
            },
            format_after_save = {
                async = true,
                lsp_fallback = true,
                timeout_ms = 2500,
            },
        },
    },
    { "ruanyl/vim-gh-line" },
    { "MunifTanjim/nui.nvim" },
    { "rcarriga/nvim-notify" },
    {
        "folke/noice.nvim",
        event = "BufReadPost",
        config = function()
            require("noice").setup({
                cmdline = {
                    format = {
                        search_up = { icon = " " },
                        search_down = { icon = " " },
                    },
                },
                messages = {
                    enabled = false,
                },
                notify = {
                    enabled = false,
                },
                lsp = {
                    progress = { enabled = false }
                },
            })
        end
    },
    {
        "tanvirtin/vgit.nvim",
        lazy = false,
        keys = {
            { "<leader>gn", "<cmd>VGit hunk_down<cr>" },
            { "<leader>gp", "<cmd>VGit hunk_up<cr>" },
        },
        config = function()
            require("vgit").setup({
                settings = {
                    live_blame = {
                        enabled = false,
                    },
                    authorship_code_lens = {
                        enabled = false,
                    },
                }
            })
        end
    },
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup()
        end
    },
    { "nvim-lualine/lualine.nvim" },
    { "SmiteshP/nvim-navic" },
    { "windwp/nvim-autopairs" },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function()
            local tools = {
                runnables = { use_telescope = true },
                inlay_hints = { only_current_line = true },
                hover_actions = { auto_focus = true },
            }
            require("rust-tools").setup({
                tools = tools,
                server = {
                    on_attach = function(client, bufnr)
                        if client.server_capabilities.documentSymbolProvider then
                            require("nvim-navic").attach(client, bufnr)
                        end
                    end,
                    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol
                        .make_client_capabilities()),
                    flags = { debounce_text_changes = 150 }
                },
                dap = {
                    adapter = {
                        type = "executable",
                        command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
                        name = "lldb",
                    },
                },
            })
        end,
    },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
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
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/vim-vsnip-integ" },
    { "rafamadriz/friendly-snippets" },

    -- telescope + deps
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", branch = "main" },
    { "nvim-telescope/telescope.nvim" },
})
