local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

opt.ruler = true
opt.backspace = 'eol,start,indent'
opt.ignorecase = true -- Ignore case when searching
opt.hlsearch = true -- Highlight search things
opt.incsearch = true -- Make search act like search in modern browsers
opt.magic = true -- Set magic on, for regular expressions
opt.showmatch = true -- Show matching bracets when text indicator is over them
-- No sound on errors
opt.errorbells = false
opt.visualbell = false
opt.list = false
opt.number = true

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

opt.ai = true -- Auto indent
opt.wrap = false

-- Always hide the statusline
opt.laststatus = 0
opt.statusline = '%t'

opt.encoding = 'utf-8'
opt.background = 'dark'
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
opt.shortmess = 'a'
opt.cmdheight = 2

-- IndentLine
g.indentLine_char = '▏'
g.indentLine_first_char = '▏'
g.indentLine_showFirstIndentLevel = 0

-- allow mousewheel scrolling in tmux+vim
opt.mouse = 'a'
