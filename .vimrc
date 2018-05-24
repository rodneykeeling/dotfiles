"pathogen setup
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Enable filetype plugin
filetype plugin on
"filetype indent on

set ruler "Always show current position
set rulerformat=column\ %c
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink
" No sound on errors
set noerrorbells
set novisualbell
set nolist
set number

syntax enable "Enable syntax hl
syntax on

" Turn backup off
set nobackup
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

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal shiftwidth=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

set t_Co=256
set encoding=utf-8
set background="dark"
colorscheme molokopy

let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

set nowritebackup

"folding settings
set foldmethod=indent   "fold based on indent
set foldlevel=20         "this is just what i use

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

" go to beginning of line
map ` ^

" vim indent guide stuff
set ts=4 sw=4 et
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236

" ctrlp ignore files
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc)$'
  \ }

set fillchars=""

" disable doublequote hiding in json files
let g:vim_json_syntax_conceal = 0

"let g:gitgutter_max_signs = 700
"map gn :GitGutterNextHunk<Enter>
"map gb :GitGutterPrevHunk<Enter>
let g:gitgutter_enabled = 0

" dont show filename/info in bottom left when opening file
set shortmess=F
