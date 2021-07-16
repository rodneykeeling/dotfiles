require 'paq-nvim' {
    {'savq/paq-nvim'};
    -- themes/colors
    {'ayu-theme/ayu-vim'};
    {'drewtempelmeyer/palenight.vim'};
    {'gosukiwi/vim-atom-dark'};
    {'joshdick/onedark.vim'};
    {'lilydjwg/colorizer'};
    {'ntk148v/vim-horizon'};
    {'projekt0n/github-nvim-theme'};
    {'rakr/vim-one'};

    -- tooling;
    {'airblade/vim-gitgutter'};
    {'davidhalter/jedi'};
    {'fatih/vim-go'};
    {'hrsh7th/nvim-compe'};
    {'kyazdani42/nvim-web-devicons'};
    {'mhinz/vim-startify'};
    {'neovim/nvim-lspconfig'};
    {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};
    {'Yggdroot/indentLine'};

    -- telescope + deps
    {'nvim-lua/popup.nvim'};
    {'nvim-lua/plenary.nvim'};
    {'nvim-telescope/telescope.nvim'};
    {'nvim-telescope/telescope-fzf-native.nvim', run='make', branch='main'};
}
