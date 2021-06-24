" dont set cursor shape to block
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

call plug#begin('~/.vim/plugged')
" themes/colors
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'joshdick/onedark.vim'
Plug 'ntk148v/vim-horizon'
Plug 'rakr/vim-one'

" tooling
Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'vim-scripts/Efficient-python-folding'
Plug 'Yggdroot/indentLine'

" telescope + deps
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }

call plug#end()

" Enable filetype plugin
filetype plugin on

set ruler
set backspace=eol,start,indent
set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
" No sound on errors
set noerrorbells
set novisualbell
set nolist
set number

syntax enable "Enable syntax hl
syntax on

" Turn backup off
set nobackup
set nowritebackup
set nowb
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set lbr
set tw=500

set ai "Auto indent
set nowrap

" Always hide the statusline
set laststatus=0
set statusline="%t"

autocmd FileType python setlocal shiftwidth=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType yaml setlocal shiftwidth=2 et

set t_Co=256
set encoding=utf-8
set background=dark
set termguicolors
set guicursor=
let ayucolor="dark"
colorscheme horizon

"folding settings
set foldmethod=indent   "fold based on indent
set foldlevel=20         "this is just what i use

" go to beginning of line
map ` ^

" vim indent guide stuff
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236

set fillchars=""

" disable doublequote hiding in json files
let g:vim_json_syntax_conceal = 0

" dont show filename/info in bottom left when opening file
set shortmess=F
set cmdheight=1

" pymode settings
let g:pymode_trim_whitespaces = 1 " trim whitespace on save
let g:pymode_options_max_line_length = 90 " max line length
let g:pymode_options_colorcolumn = 0 " disable line length color column

" IndentLine {{
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_setColors = 0
" }}

" allow mousewheel scrolling in tmux+vim
set mouse=a

" map leader key to Space
let mapleader = " "

" <leader>c to print current class name
nnoremap <leader>c :<c-u>echo trim(getline(search('^class', 'bnW')))<cr>
" <leader>gg to toggle GitGutterSignsToggle
nnoremap <leader>gg :GitGutterSignsToggle<cr>
" <leader>gd to goto defn via neovim lsp
nnoremap <leader>d <cmd>lua vim.lsp.buf.definition()<cr>

lua require'lspconfig'.pyright.setup{}

" LSP diagnostics show only on hover
lua <<EOF
 vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false, 
    }
)
vim.cmd [[set updatetime=200 | autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
vim.cmd [[set updatetime=200 | autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'bash', 'dockerfile', 'go', 'graphql', 'javascript', 'json', 'lua', 'python', 'query', 'typescript', 'yaml', },
    highlight = {
        enable = true,              -- false will disable the whole extension
        --disable = { 'python' },  -- list of language that will be disabled
    },
    indent = {
        enable = true
    },
}
EOF

lua <<EOF
require('telescope').setup {
    pickers = {
        find_files = {
            theme = 'dropdown'
        },
        git_files = {
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
EOF

nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
