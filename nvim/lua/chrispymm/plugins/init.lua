return {
    {
        "dracula/vim",
        name = "dracula",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme dracula]])
        end,
    },

    {"tpope/vim-vinegar"}, -- nicer netrw
    {"tpope/vim-fugitive"}, -- git
    {"tpope/vim-commentary"}, -- comments
    {"tpope/vim-rails"}, -- make rails project nice
    {"christoomey/vim-tmux-navigator"}, -- make vim and tmux navigation work together
    {
        "nelstrom/vim-textobj-rubyblock",
        dependencies = {
            "kana/vim-textobj-user"
        }
    }, -- adds ar and ir ruby block textobject
    {"vim-test/vim-test"}, -- adds support for running tests
    {"preservim/vimux"},
    {"glench/vim-jinja2-syntax"}, --jinja/nunjucks syntax highlighting

    -- UI Stuff
    {"kyazdani42/nvim-web-devicons"},
    {"kyazdani42/nvim-tree.lua"},
    {"nvim-lualine/lualine.nvim"},
    {"windwp/nvim-autopairs"}, -- Autopairs, integrates with both cmp and treesitter
    {"folke/which-key.nvim"}, -- pop up keymap help on <leader>
    {"lewis6991/gitsigns.nvim"},
    {"ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- LSP stuff
    {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/nvim-cmp"},
    {"L3MON4D3/LuaSnip"},
    {"simrat39/symbols-outline.nvim"},

}
