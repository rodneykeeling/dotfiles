local map = vim.api.nvim_set_keymap

require("telescope").setup {
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            horizontal = {
                prompt_position = "top",
            },
            vertical = {
                mirror = false,
                prompt_position = "top",
            },
            width = 85,
            height = 0.40,
        },
    },
    pickers = {
        find_files = {
            previewer = false,
        },
        git_files = {
            previewer = false,
        },
        live_grep = {
            layout_config = {
                height = 0.7,
            }
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
            }
        }
    }

require("telescope").load_extension("fzf")
require("telescope").load_extension("noice")
require('telescope').load_extension('projects')

map("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".find_files()<cr>]], {})
map("n", "<leader>gf", [[<cmd>lua require"telescope.builtin".git_files({ cwd = vim.fn.expand("%:p:h") })<cr>]], {})
map("n", "<leader>gs", [[<cmd>lua require"telescope.builtin".git_status()<cr>]], {})
map("n", "<leader>p", [[<cmd>lua require"telescope".extensions.projects.projects()<cr>]], {})
map("n", "<leader>rg", [[<cmd>lua require"telescope.builtin".live_grep()<cr>]], {})
map("n", "<leader>*", [[<cmd>lua require"telescope.builtin".grep_string()<cr>]], {})

vim.cmd[[
    highlight TelescopeNormal guibg=#23272e
    highlight TelescopePromptBorder guifg=#31363f guibg=#31363f
    highlight TelescopePromptNormal guifg=#abb2bf guibg=#31363f
    highlight TelescopePromptPrefix guifg=#a9a1e1 guibg=#31363f
    highlight TelescopePromptTitle guifg=#1e222a guibg=#a9a1e1
    highlight TelescopePreviewTitle guifg=#1e222a guibg=#98be65
    highlight TelescopePreviewBorder guifg=#23272e guibg=#23272e
    highlight TelescopeResultsTitle guifg=#23272e guibg=#23272e
    highlight TelescopeResultsBorder guifg=#23272e guibg=#23272e
    highlight TelescopeSelection guibg=#31363f
]]
