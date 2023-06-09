require("lazy").setup({
    -- themes/colors
    {"norcalli/nvim-colorizer.lua"};
    {"NTBBloodbath/doom-one.nvim", lazy=true};
    {"rebelot/kanagawa.nvim", lazy=true};
    {"catppuccin/nvim"};

    -- tooling;
    {"kyazdani42/nvim-web-devicons"};
    {"mhinz/vim-startify"};
    {"neovim/nvim-lspconfig"};
    {"nvim-treesitter/nvim-treesitter", cmd="TSUpdate"};
    {"Yggdroot/indentLine"};
    {"numToStr/Comment.nvim",
        config=function()
            require("Comment").setup()
        end
    };
    {"ggandor/lightspeed.nvim"};
    {"kyazdani42/nvim-tree.lua",
        lazy=true,
        keys={{"<leader>t", "<cmd>NvimTreeToggle<cr>"}},
        config=function()
            require("nvim-tree").setup()
        end,
    };
    {"jose-elias-alvarez/null-ls.nvim",
        ft="python",
        config=function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.black,
                    require("null-ls").builtins.formatting.isort,
                    require("null-ls").builtins.formatting.trim_whitespace,
                },
            })
        end
    },
    {"akinsho/toggleterm.nvim",
        branch="main",
        lazy=true,
        keys={{"<leader>~", "<cmd>ToggleTerm<cr>"}},
        config=function()
            require("toggleterm").setup({
                highlights = {
                    Normal = {
                        guibg = "#24273A",
                    },
                    NormalBorder = {
                        guibg = "#ffffff",
                    },
                    NormalFloat = {
                        guibg = "#24273A",
                    },
                },
                direction = "horizontal",
                shade_terminals = false,
            })
        end,
    };
    {"ruanyl/vim-gh-line"};
    {"glepnir/lspsaga.nvim"};
    {"MunifTanjim/nui.nvim"};
    {"rcarriga/nvim-notify"};
    {"folke/noice.nvim",
        commit="f782acb6a7d4562e3551751fcff7152febd9138e",
        config=function()
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
    };
    {"lewis6991/gitsigns.nvim"};
    {"nvim-lualine/lualine.nvim"};
    {"SmiteshP/nvim-navic"};
    {"ahmedkhalf/project.nvim"};
    {"windwp/nvim-autopairs"};
    {"simrat39/rust-tools.nvim",
        ft="rust",
        config=function()
            local tools = {
                runnables = {use_telescope = true},
                inlay_hints = {only_current_line = true},
                hover_actions = {auto_focus = true},
            }
            require("rust-tools").setup({
                tools = tools,
                server = {
                    on_attach = function(client, bufnr)
                        if client.server_capabilities.documentSymbolProvider then
                            require("nvim-navic").attach(client, bufnr)
                        end
                    end,
                    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
                    flags = {debounce_text_changes = 150}
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
    };
    {"mfussenegger/nvim-dap"};
    {"rcarriga/nvim-dap-ui"};

    -- completion
    {"hrsh7th/nvim-cmp"};
    {"hrsh7th/cmp-nvim-lsp"};
    {"hrsh7th/cmp-buffer"};
    {"hrsh7th/cmp-path"};
    {"hrsh7th/cmp-vsnip"};
    {"hrsh7th/vim-vsnip"};
    {"hrsh7th/vim-vsnip-integ"};
    {"rafamadriz/friendly-snippets"};

    -- telescope + deps
    {"nvim-lua/popup.nvim"};
    {"nvim-lua/plenary.nvim"};
    {"nvim-telescope/telescope-fzf-native.nvim", build="make", branch="main"};
    {"nvim-telescope/telescope.nvim"};
})
