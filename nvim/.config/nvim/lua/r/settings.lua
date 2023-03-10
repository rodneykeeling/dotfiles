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
opt.guicursor = "n-i:ver1"

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

g.go_def_mapping_enabled = 0
g.go_doc_keywordprg_enabled = 0

vim.opt.termguicolors = true

require("colorizer").setup()

vim.cmd[[ colorscheme catppuccin-macchiato ]]

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
    lsp = {
        progress = { enabled = false }
    },
})

local navic = require("nvim-navic")
navic.setup({
    highlight = true,
})
local winbar_config = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            { 'filetype', icon_only = true, separator = false, padding = 0 },
            {
                'filename',
                path=1,
                symbols = { modified = '●', unnamed = '', readonly = '' },
                color = { fg = '#da8548' },
                padding = 1
            },
            {
                navic.get_location,
                cond = navic.is_available,
                color = { bg = '#24273A' },
                padding = { left = 1, right = 0 },
            }
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
                    inactive = { fg = '#555555', bg = '#24273A' }
                },
            }
        },
        lualine_y = {},
        lualine_z = {}
}
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = { c = { bg = '#24273A' } },
            inactive = { c = { bg = '#24273A' } },
        },
        component_separators = { left = '>', right = '>'},
        section_separators = { left = '', right = ''},
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = { },
    inactive_sections = { },
    tabline = winbar_config,
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require('project_nvim').setup()

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>gn', gs.next_hunk)
    map('n', '<leader>gp', gs.prev_hunk)
    map('n', '<leader>hp', gs.preview_hunk)
  end
}

require("nvim-autopairs").setup()

require('lspsaga').setup({
    diagnostic = {
        on_insert = false,
    },
    ui = {
        border = 'rounded',
        code_action = '',
        colors = {
            --float window normal bakcground color
            normal_bg = '#24273A',
            --title background color
            title_bg = '#afd700',
            red = '#e95678',
            magenta = '#b33076',
            orange = '#FF8700',
            yellow = '#f7bb3b',
            green = '#afd700',
            cyan = '#36d0e0',
            blue = '#61afef',
            purple = '#CBA6F7',
            white = '#00ff00',
            black = '#ff0000',
        }
    },
    symbol_in_winbar = {
        enable = false,
    }
})

vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, fg = "#a9a1e1", bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = "#24273A"})
vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = "#24273A"})
