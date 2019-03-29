" vim-plug plugin management
call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim', { 'dir': '~/.vim/colors/ayu-vim' }
Plug 'drewtempelmeyer/palenight.vim', { 'dir': '~/.vim/colors/palenight' }
Plug 'elzr/vim-json'
Plug 'vim-scripts/Efficient-python-folding'
call plug#end()

" Enable filetype plugin
filetype plugin on

set ruler "Always show current position
set rulerformat=%25(%t\ column\ %c%)
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
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

set t_Co=256
set encoding=utf-8
"set background=dark
set termguicolors
let ayucolor="dark"
colorscheme ayu

"folding settings
set foldmethod=indent   "fold based on indent
set foldlevel=20         "this is just what i use

" go to beginning of line
map ` ^

" vim indent guide stuff
set ts=4 sw=4 et
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236

set fillchars=""

" disable doublequote hiding in json files
let g:vim_json_syntax_conceal = 0

" dont show filename/info in bottom left when opening file
set shortmess=a
set cmdheight=1
