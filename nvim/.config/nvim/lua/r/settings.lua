vim.opt.ruler = true
vim.opt.backspace = "eol,start,indent"
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.magic = true      -- Set magic on, for regular expressions
vim.opt.showmatch = true  -- Show matching bracets when text indicator is over them
-- No sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.list = true
vim.opt.listchars = "tab:>-,trail:."
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true

-- Turn backup off
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.lbr = true
vim.opt.tw = 90

vim.opt.wrap = false

-- Always hide the statusline
vim.opt.laststatus = 0
vim.opt.statusline = "%t"

vim.opt.termguicolors = true
vim.opt.guicursor = "n-i:ver1"

-- folding settings
vim.opt.foldmethod = "indent" -- fold based on indent
vim.opt.foldlevel = 20        -- this is just what i use

vim.opt.fillchars = ""

-- disable doublequote hiding in json files
vim.g.vim_json_conceal = 0
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0

-- dont show filename/info in bottom left when opening file
vim.opt.shortmess = "aF"
vim.opt.cmdheight = 1

-- IndentLine
vim.g.indentLine_char = "▏"
vim.g.indentLine_first_char = "▏"
vim.g.indentLine_showFirstIndentLevel = 0

-- allow mousewheel scrolling in tmux+vim
vim.opt.mouse = "a"

-- colorscheme overrides
vim.cmd [[ highlight DiagnosticFloatingError guifg=#ff6c6b ]]

-- plugin-specific settings
vim.g.startify_list_order = {
    { "Project " .. vim.fn.getcwd() }, "dir",
    { "Bookmarks" }, "bookmarks",
    { "MRU" }, "files",
}
vim.g.startify_bookmarks = {
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
vim.g.startify_files_number = 5
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_custom_header = ""

vim.g.go_def_mapping_enabled = 0
vim.g.go_doc_keywordprg_enabled = 0

vim.opt.termguicolors = true

vim.opt.clipboard = unnamedplus

require("colorizer").setup()

vim.cmd [[ colorscheme catppuccin-macchiato ]]

local navic = require("nvim-navic")
navic.setup({
    highlight = true,
    icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = "𝜆 ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = "𝜆 ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " "
    },
    lsp = {
        auto_attach = true,
    }
})
local winbar_config = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        { "filetype", icon_only = true, separator = false, padding = 0 },
        {
            "filename",
            path = 1,
            symbols = { modified = "●", unnamed = "", readonly = "" },
            color = { fg = "#da8548" },
            padding = 1
        },
        {
            navic.get_location,
            cond = navic.is_available,
            color = { bg = "#24273A" },
            padding = { left = 1, right = 0 },
        }
    },
    lualine_x = {
        {
            "buffers",
            show_filename_only = true,
            symbols = {
                alternate_file = "",
                unnamed = "",
            },
            buffers_color = {
                active = { bg = "#24273A" },
                inactive = { fg = "#555555", bg = "#24273A" }
            },
        }
    },
    lualine_y = {},
    lualine_z = {}
}

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = { c = { bg = "#24273A" } },
            inactive = { c = { bg = "#24273A" } },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {},
    inactive_sections = {},
    tabline = winbar_config,
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require("project_nvim").setup()

require("nvim-autopairs").setup()

require("lspsaga").setup({
    diagnostic = {
        on_insert = false,
    },
    ui = {
        border = "rounded",
        code_action = "",
        colors = {
            --float window normal bakcground color
            normal_bg = "#24273A",
            --title background color
            title_bg = "#afd700",
            red = "#e95678",
            magenta = "#b33076",
            orange = "#FF8700",
            yellow = "#f7bb3b",
            green = "#afd700",
            cyan = "#36d0e0",
            blue = "#61afef",
            purple = "#CBA6F7",
            white = "#00ff00",
            black = "#ff0000",
        }
    },
    symbol_in_winbar = {
        enable = false,
    }
})

vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, fg = "#a9a1e1", bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "#24273A" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#24273A" })
