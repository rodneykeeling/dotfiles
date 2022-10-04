local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

opt.ruler = true
opt.backspace = "eol,start,indent"
opt.ignorecase = true -- Ignore case when searching
opt.magic = true -- Set magic on, for regular expressions
opt.showmatch = true -- Show matching bracets when text indicator is over them
-- No sound on errors
opt.errorbells = false
opt.visualbell = false
opt.list = true
opt.listchars = "tab:>-,trail:."
opt.number = true
opt.relativenumber = true
opt.hidden = true

-- Turn backup off
opt.backup = false
opt.writebackup = false
opt.wb = false
opt.swapfile = false

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smarttab = true
opt.lbr = true
opt.tw = 500

opt.wrap = false

-- Always hide the statusline
opt.laststatus = 0
opt.statusline = "%t"

opt.termguicolors = true
opt.guicursor = ""

-- folding settings
opt.foldmethod = "indent" -- fold based on indent
opt.foldlevel = 20 -- this is just what i use

opt.fillchars = ""

-- disable doublequote hiding in json files
g.vim_json_conceal = 0
g.vim_json_syntax_conceal = 0
g.vim_markdown_conceal = 0

-- dont show filename/info in bottom left when opening file
opt.shortmess = "aF"
opt.cmdheight = 1

-- IndentLine
g.indentLine_char = "▏"
g.indentLine_first_char = "▏"
g.indentLine_showFirstIndentLevel = 0

-- allow mousewheel scrolling in tmux+vim
opt.mouse = "a"

-- colorscheme overrides
cmd[[ highlight DiagnosticFloatingError guifg=#ff6c6b ]]

-- plugin-specific settings
g.startify_list_order = {
    {"Project " .. fn.getcwd()}, "dir",
    {"Bookmarks"}, "bookmarks",
    {"MRU"}, "files",
}
g.startify_bookmarks = {
    "~/.config/nvim/init.lua",
    "~/.config/nvim/lua/r/completion.lua",
    "~/.config/nvim/lua/r/lsp.lua",
    "~/.config/nvim/lua/r/plugins.lua",
    "~/.config/nvim/lua/r/settings.lua",
    "~/.config/nvim/lua/r/telescope.lua",
    "~/.config/nvim/lua/r/treesitter.lua",
    "~/.config/zsh/.zshrc",
    "~/.config/zsh/.zsh_history",
}
g.startify_files_number = 5
g.startify_change_to_vcs_root = 1
g.startify_custom_header = ""

vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        numbers = "none",
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_buffer_icons = true,
        show_tab_indicators = false,
        always_show_bufferline = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
            }
        },
    },
    highlights = {
        background = {
            bg = "#24283b",
            fg = "#555555",
        },
        buffer_selected = {
            bold = true,
            fg = "#ffffff",
        },
        fill = {
            bg = "#24283b",
            fg = "#ffffff",
        },
        separator = {
            bg = "#24283b",
            fg = "#24283b",
        },
        modified = {
            bg = "#24283b",
        },
        duplicate = {
            bg = "#24283b",
        },
        pick = {
            bg = "#24283b",
            fg = "#ffffff",
        },
        pick_selected = {
            bg = "#24283b",
            fg = "#ffffff",
        },
        indicator_selected = {
            bg = "#24283b",
            fg = "#24283b",
        },
    }
}

require("Comment").setup()
require("colorizer").setup()
require("nvim-tree").setup()

-- require("doom-one").setup({
--     plugins_integrations = {
--         bufferline = true,
--         gitgutter = true,
--         nvim_tree = true,
--         startify = true,
--         telescope = true,
--     }
-- })
g.tokyonight_style = "storm"
vim.cmd[[ colorscheme tokyonight ]]

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.trim_whitespace,
    },
})

require("toggleterm").setup()
