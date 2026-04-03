vim.opt.ruler = true
vim.opt.backspace = 'eol,start,indent'
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.magic = true -- Set magic on, for regular expressions
vim.opt.showmatch = true -- Show matching bracets when text indicator is over them
-- No sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.list = true
vim.opt.listchars = 'tab:>-,trail:.'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.cursorline = true

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
vim.opt.statusline = '%t'

vim.opt.termguicolors = true
vim.opt.guicursor = 'n-i:ver1'

-- folding settings
vim.opt.foldmethod = 'indent' -- fold based on indent
vim.opt.foldlevel = 20 -- this is just what i use

vim.opt.fillchars = ''

-- disable doublequote hiding in json files
vim.g.vim_json_conceal = 0
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0

-- dont show filename/info in bottom left when opening file
vim.opt.shortmess = 'aF'
vim.opt.cmdheight = 1

-- IndentLine
vim.g.indentLine_char = '▏'
vim.g.indentLine_first_char = '▏'
vim.g.indentLine_showFirstIndentLevel = 0
vim.g.indentLine_fileTypeExclude = { 'markdown' }

-- allow mousewheel scrolling in tmux+vim
vim.opt.mouse = 'a'

-- colorscheme overrides
vim.cmd([[ highlight DiagnosticFloatingError guifg=#ff6c6b ]])

-- plugin-specific settings
vim.g.startify_list_order = {
  { 'Project ' .. vim.fn.getcwd() },
  'dir',
  { 'Bookmarks' },
  'bookmarks',
  { 'MRU' },
  'files',
}
vim.g.startify_bookmarks = {
  '~/.config/nvim/init.lua',
  '~/.config/nvim/lua/r/completion.lua',
  '~/.config/nvim/lua/r/lsp.lua',
  '~/.config/nvim/lua/r/plugins.lua',
  '~/.config/nvim/lua/r/settings.lua',
  '~/.config/nvim/lua/r/telescope.lua',
  '~/.config/nvim/lua/r/treesitter.lua',
  '~/.config/zsh/.zshrc',
  '~/.config/zsh/.zsh_history',
}
vim.g.startify_files_number = 5
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_custom_header = ''

vim.g.go_def_mapping_enabled = 0
vim.g.go_doc_keywordprg_enabled = 0

vim.opt.clipboard = unnamedplus

vim.cmd.colorscheme('catppuccin-macchiato')

vim.cmd([[ au BufRead,BufNewFile *.graphql,*.graphqls,*.gql setfiletype graphql ]])
vim.cmd([[ au FileType graphql setlocal shiftwidth=2 tabstop=2 ]])
vim.cmd([[ au! BufAdd,BufRead,BufNew,BufEnter *.json let g:indentLine_conceallevel=0 ]])
