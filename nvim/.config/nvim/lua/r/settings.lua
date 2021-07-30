local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

opt.ruler = true
opt.backspace = 'eol,start,indent'
opt.ignorecase = true -- Ignore case when searching
opt.magic = true -- Set magic on, for regular expressions
opt.showmatch = true -- Show matching bracets when text indicator is over them
-- No sound on errors
opt.errorbells = false
opt.visualbell = false
opt.list = false
opt.number = true
opt.relativenumber = true

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
opt.statusline = '%t'

opt.termguicolors = true
opt.guicursor = ''
g.ayucolor = 'dark'
cmd 'colorscheme horizon'

-- folding settings
opt.foldmethod = 'indent' -- fold based on indent
opt.foldlevel = 20 -- this is just what i use

opt.fillchars = ''

-- disable doublequote hiding in json files
g.vim_json_syntax_conceal = 0

-- dont show filename/info in bottom left when opening file
opt.shortmess = 'aF'
opt.cmdheight = 1

-- IndentLine
g.indentLine_char = '▏'
g.indentLine_first_char = '▏'
g.indentLine_showFirstIndentLevel = 0

-- allow mousewheel scrolling in tmux+vim
opt.mouse = 'a'

g.startify_list_order = {
    {'Bookmarks'}, 'bookmarks',
    {'MRU'}, 'files',
    {'MRU ' .. fn.getcwd()}, 'dir',
}
g.startify_bookmarks = {
    '~/.config/nvim/init.lua',
    '~/.config/nvim/lua/r/plugins.lua',
    '~/.config/nvim/lua/r/settings.lua',
    '~/.config/zsh/.zshrc',
}
g.startify_files_number = 5
g.startify_custom_header = ''
g.startify_change_to_vcs_root = 1

vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        numbers = "none",
        close_icon = '',
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_tab_indicators = false,
        always_show_bufferline = false,
    },
    highlights = {
        buffer_selected = {
            gui = "bold"
        }
    }
}
