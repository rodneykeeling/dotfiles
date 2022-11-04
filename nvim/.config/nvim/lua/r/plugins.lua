require "paq" {
    {"savq/paq-nvim"};
    -- themes/colors
    {"norcalli/nvim-colorizer.lua"};
    {"projekt0n/github-nvim-theme"};
    {"rakr/vim-one"};
    {"NTBBloodbath/doom-one.nvim"};
    {"rebelot/kanagawa.nvim"};
    {"folke/tokyonight.nvim"};

    -- tooling;
    {"lewis6991/gitsigns.nvim"};
    {"fatih/vim-go"};
    {"kyazdani42/nvim-web-devicons"};
    {"mhinz/vim-startify"};
    {"neovim/nvim-lspconfig"};
    {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"};
    {"Yggdroot/indentLine"};
    {"numToStr/Comment.nvim"};
    {"ggandor/lightspeed.nvim"};
    {"kyazdani42/nvim-tree.lua"};
    {"jose-elias-alvarez/null-ls.nvim"};
    {"akinsho/toggleterm.nvim", branch="main"};
    {"ruanyl/vim-gh-line"};
    {"glepnir/lspsaga.nvim"};
    {"MunifTanjim/nui.nvim"};
    {"rcarriga/nvim-notify"};
    {"folke/noice.nvim"};
    {"nvim-lualine/lualine.nvim"};
    {"SmiteshP/nvim-navic"};
    {"ahmedkhalf/project.nvim"};

    -- completion
    {"hrsh7th/nvim-cmp"};
    {"hrsh7th/cmp-nvim-lsp"};
    {"hrsh7th/cmp-buffer"};
    {"hrsh7th/cmp-path"};
    {"hrsh7th/cmp-vsnip"};
    {"hrsh7th/vim-vsnip"};
    {"hrsh7th/vim-vsnip-integ"};
    {"rafamadriz/friendly-snippets"};

    -- telescope + deps
    {"nvim-lua/popup.nvim"};
    {"nvim-lua/plenary.nvim"};
    {"nvim-telescope/telescope.nvim"};
    {"nvim-telescope/telescope-fzf-native.nvim", run="make", branch="main"};
}
