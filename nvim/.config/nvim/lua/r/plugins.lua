require 'paq' {
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
    {'akinsho/nvim-bufferline.lua'};
    {'NTBBloodbath/doom-one.nvim'};
    {'rebelot/kanagawa.nvim'};

    -- tooling;
    {'airblade/vim-gitgutter'};
    -- {'davidhalter/jedi-vim'};
    {'fatih/vim-go'};
    {'kyazdani42/nvim-web-devicons'};
    {'mhinz/vim-startify'};
    {'neovim/nvim-lspconfig'};
    {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};
    {'Yggdroot/indentLine'};
    {'numToStr/Comment.nvim'};
    {'ggandor/lightspeed.nvim'};

    -- completion
    {'hrsh7th/nvim-cmp'};
    {'hrsh7th/cmp-nvim-lsp'};
    {'hrsh7th/cmp-buffer'};
    {'hrsh7th/cmp-path'};
    {'hrsh7th/cmp-vsnip'};
    {'hrsh7th/vim-vsnip'};
    {'hrsh7th/vim-vsnip-integ'};
    {'rafamadriz/friendly-snippets'};

    -- telescope + deps
    {'nvim-lua/popup.nvim'};
    {'nvim-lua/plenary.nvim'};
    {'nvim-telescope/telescope.nvim'};
    {'nvim-telescope/telescope-fzf-native.nvim', run='make', branch='main'};
}
