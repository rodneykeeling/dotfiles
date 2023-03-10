require("lazy").setup({
    -- themes/colors
    {"norcalli/nvim-colorizer.lua"};
    {"projekt0n/github-nvim-theme", lazy=true};
    {"rakr/vim-one", lazy=true};
    {"NTBBloodbath/doom-one.nvim", lazy=true};
    {"rebelot/kanagawa.nvim", lazy=true};
    {"catppuccin/nvim"};

    -- tooling;
    {"lewis6991/gitsigns.nvim"};
    {"fatih/vim-go", ft="go"};
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
                        guibg = '#24273A',
                    },
                },
                direction = 'horizontal',
                shade_terminals = false,
            })
        end,
    };
    {"ruanyl/vim-gh-line"};
    {"glepnir/lspsaga.nvim"};
    {"MunifTanjim/nui.nvim"};
    {"rcarriga/nvim-notify"};
    {"folke/noice.nvim"};
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
                hover_actions = {auto_focus = true}
            }
            require('rust-tools').setup({
                tools = tools,
                server = {
                    on_attach = lsp_on_attach,
                    capabilities = capabilities,
                    flags = {debounce_text_changes = 150}
                },
            })
        end,
    };
    {"nvim-neorg/neorg",
        lazy=true,
        keys={{"<leader>n", "<cmd>Neorg workspace notes<cr>"}},
        config=function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.norg.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                    ["core.norg.qol.todo_items"] = {},
                },
            }
        end
    };

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
