local map = vim.api.nvim_set_keymap

require('telescope').setup {
    pickers = {
        find_files = {
            previewer = false,
            theme = 'dropdown'
        },
        git_files = {
            previewer = false,
            theme = 'dropdown'
        },
        live_grep = {
            theme = 'dropdown'
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = 'smart_case',        -- or 'ignore_case' or 'respect_case'
            -- the default case_mode is 'smart_case'
            }
        }
    }
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

map('n', '<leader>ff', [[<cmd>lua require'telescope.builtin'.find_files()<cr>]], {})
-- set cwd to root of current buffer location
map('n', '<leader>gf', [[<cmd>lua require'telescope.builtin'.git_files({ cwd = vim.fn.expand('%:p:h') })<cr>]], {})
map('n', '<leader>fg', [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]], {})
