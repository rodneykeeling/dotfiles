" dont set cursor shape to block
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

call plug#begin('~/.vim/plugged')
" themes/colors
Plug 'ayu-theme/ayu-vim', { 'dir': '~/.vim/colors/ayu-vim' }
Plug 'drewtempelmeyer/palenight.vim', { 'dir': '~/.vim/colors/palenight' }
Plug 'gosukiwi/vim-atom-dark', { 'dir': '~/.vim/colors/vim-atom-dark' }
Plug 'joshdick/onedark.vim', { 'dir': '~/.vim/colors/onedark' }
Plug 'ntk148v/vim-horizon'
Plug 'rakr/vim-one', { 'dir': '~/.vim/colors/vim-one' }

" tooling
let g:polyglot_disabled = ['markdown']
Plug 'airblade/vim-gitgutter'
Plug 'ruanyl/vim-gh-line'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/Efficient-python-folding'
Plug 'Yggdroot/indentLine'
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
set wrap "Wrap lines

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
colorscheme ayu

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
let g:indentLine_showFirstIndentLevel = 2
let g:indentLine_setColors = 0
" }}

" allow mousewheel scrolling in tmux+vim
set mouse=a

" <leader>c to print current class name
nnoremap <leader>c :<c-u>echo trim(getline(search('^class', 'bnW')))<cr>
" <leader>gg to toggle GitGutterSignsToggle
nnoremap <leader>gg :GitGutterSignsToggle<cr>
