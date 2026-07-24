-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- 0. Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- 1. telescope (fuzzy finder)
    -- use {
    --     'nvim-telescope/telescope.nvim', tag = '0.1.4',
    --     -- or                            , branch = '0.1.x',
    --     requires = { {'nvim-lua/plenary.nvim'} }
    -- }
    use "ibhagwan/fzf-lua"

    use { "junegunn/fzf", run = "./install --bin" }

    -- 3. treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        build = ":TSUpdate"
    }

    -- 4. Git wrapper
    use 'tpope/vim-fugitive'


    -- 5. LSP-Zero
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v1.x',
    --     requires = {
    --         -- LSP Support
    --         {'neovim/nvim-lspconfig'},             -- Required
    --         {'williamboman/mason.nvim'},           -- Optional
    --         {'williamboman/mason-lspconfig.nvim'}, -- Optional

    --         -- Autocompletion
    --         {'hrsh7th/nvim-cmp'},         -- Required
    --         {'hrsh7th/cmp-nvim-lsp'},     -- Required
    --         {'hrsh7th/cmp-buffer'},       -- Optional
    --         {'hrsh7th/cmp-path'},         -- Optional
    --         {'saadparwaiz1/cmp_luasnip'}, -- Optional
    --         {'hrsh7th/cmp-nvim-lua'},     -- Optional

    --         -- Snippets
    --         {'L3MON4D3/LuaSnip'},             -- Required
    --         {'rafamadriz/friendly-snippets'}, -- Optional
    --     }
    -- }


    -- 6. Nvim-R
    use 'jalvesaq/Nvim-R'

    --7. lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- 8. nvim-autopairs
    -- use {
    --     "windwp/nvim-autopairs",
    --     config = function() require("nvim-autopairs").setup {} end
    -- }

    -- 9. to use ipython in vim    
    use 'jpalardy/vim-slime'

    -- 10. gruvbox
    use {'morhetz/gruvbox'}

    -- colorscheme
    -- use {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- }

    use {
        'Mofiqul/dracula.nvim'
    }

end)
