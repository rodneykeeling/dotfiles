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
        },
    },
    pickers = {
        buffers = {
            initial_mode = "normal"
        },
        find_files = {
            layout_config = {
                height = 0.5
            },
            previewer = false,
        },
        git_files = {
            layout_config = {
                height = 0.5
            },
            previewer = false,
        },
        git_status = {
            initial_mode = "normal"
        },
        grep_string = {
            layout_config = {
                height = 0.7
            }
        },
        live_grep = {
            layout_config = {
                height = 0.7,
            }
        },
        marks = {
            initial_mode = "normal"
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

vim.keymap.set("n", "<leader>r", [[<cmd>lua require"telescope.builtin".lsp_references()<cr>]], {})
vim.keymap.set("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".find_files()<cr>]], {})
vim.keymap.set("n", "<leader>bs", [[<cmd>lua require"telescope.builtin".buffers()<cr>]], {})
vim.keymap.set("n", "<leader>gf", [[<cmd>lua require"telescope.builtin".git_files({ cwd = vim.fn.expand("%:p:h") })<cr>]],
    {})
vim.keymap.set("n", "<leader>gs", [[<cmd>lua require"telescope.builtin".git_status()<cr>]], {})
vim.keymap.set("n", "<leader>m", [[<cmd>lua require"telescope.builtin".marks({ mark_type = "global" })<cr>]], {})
vim.keymap.set("n", "<leader>rg", [[<cmd>lua require"telescope.builtin".live_grep()<cr>]], {})
vim.keymap.set("n", "<leader>*", [[<cmd>lua require"telescope.builtin".grep_string()<cr>]], {})

vim.cmd [[
    highlight TelescopeNormal guibg=#1E2030
    highlight TelescopePromptBorder guifg=#1E2030 guibg=#1E2030
    highlight TelescopePromptNormal guifg=#abb2bf guibg=#1E2030
    highlight TelescopePromptPrefix guifg=#a9a1e1 guibg=#1E2030
    highlight TelescopePromptTitle guifg=#1e222a guibg=#a9a1e1
    highlight TelescopePreviewTitle guifg=#B7BDF8 guibg=#98be65
    highlight TelescopePreviewBorder guifg=#B7BDF8 guibg=#1E2030
    highlight TelescopeResultsTitle guifg=#B7BDF8 guibg=#1E2030
    highlight TelescopeResultsBorder guifg=#B7BDF8 guibg=#1E2030
    highlight TelescopeSelection guifg=#B7BDF8 guibg=#24273A
    highlight TelescopeMatching guifg=#B7BDF8
]]
